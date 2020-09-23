<?php

namespace App\Http\Controllers\backend;


use App\Models\Requestfp;
use App\Models\Purchase;
use App\Models\PurchaseItem;
use App\Models\Bahanmros;
use App\Models\Supplier;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Auth;
use DB;
use PDF;

class PRController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $this->checkpermission('pr-list');
        $purchase =DB::table('purchases')
            ->join('suppliers', 'suppliers.id', '=', 'purchases.supplier_id')    
            ->get(); 
       $purchase_item =DB::table('purchase_items')
            ->join('purchases', 'purchases.id', '=', 'purchase_items.purchase_id') 
            ->join('requestfps', 'requestfps.id', '=', 'purchase_items.requestfp_id')
            ->select('requestfps.*', 'purchases.*')    
            ->get(); 
        return view('backend.pr.list', compact('purchase','suppliers', 'purchase_items', 'requestfps'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->checkpermission('pr-create');
        $requestfps = Requestfp::all();        
        $suppliers = Supplier::all();   
        $purchase = Purchase::all();
        

        return view('backend.pr.create', compact('purchase','requestfps', 'suppliers','requestfps'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    
    public function store(Request $request)
    {
         $this->validate($request, [
            'nopr' => 'required',
            
        ]);
        
        $message = Purchase::create([
            'nopr' => $request->nopr,
            'supplier_id' => $request->supplier_id,
            'issue_date' => $request->issue_date,
            'delivery_date' => $request->delivery_date,
            'status' => $request->status,

            'created_by' => Auth::user()->username,
            'created_at' => date('Y-m-d H:i:s'),          
        ]);
        if ($message) {
            return redirect()->route('pr.list')->with('success_message', 'successfully created ');
        } else {
            return redirect()->route('pr.create')->with('error_message', 'Failed To create');
        }
    }

    public function storeItems(Request $request, $id)
    
    {
         $this->validate($request, [
                'nopr' => 'required',
            ]);

        $input = $request->all();   
        $purchase = Purchase::find($id);
        $purchase_item = $purchase->purchaseItems()->create([
                'requestfp_id' => $input['requestfp_id'],        
                'nopr' => $input['nopr'],
                'code' => $input['code'],
                'qty' => $input['qty'],
                'unit' => $input['unit'],
                'price' => $input['price'],
                'total_price' => $input['qty'] * $input['price'],
                'created_by' => Auth::user()->username,
            'created_at' => date('Y-m-d H:i:s'),     
        ]);
        if ($purchase_item) {
           return redirect()->back()->with('success', 'PPMP Item Added');
        } else {
            return redirect()->back()->with('danger', 'PPMP Item Failed to add');
        } 
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $this->checkpermission('pr-edit');
        $purchase = Purchase::findorFail($id);       
        $purchase_id = $id;
        $collect = $purchase->purchaseItems;
        $grouped = $collect->groupBy('code');
        return view('backend.pr.ViewItems', compact('purchase', 'grouped','purchase_id'));   
    }

   public function editItems($purchase_id, $id)
    {
        $purchase = Purchase::findorFail($purchase_id);
        $collect = $purchase->purchaseItems;
        $grouped = $collect->groupBy('code');
        $item_data = $purchase->purchaseItems->where('id',$id)->first();
        return view('backend.pr.EditItems', compact('id','grouped','item_data','ppmp_id','ppmp'));
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
         $this->validate($request, [
            'nopr' => 'required',          
        ]);
        $pc = Purchase::find($id);
        $pc->nopr = $request->nopr;
        $pc->supplier_id = $request->supplier_id;
        $pc->issue_date = $request->issue_date;
        $pc->delivery_date = $request->delivery_date;
        $pc->total_price = $request->price * $request->qty;
        $pc->modified_by = Auth::user()->username;
        $pc->updated_at = date('Y-m-d H:i:s');
        $message = $pc->update();
        if ($message) {
            return redirect()->route('pr.list')->with('success_message', 'successfully updated');
        } else {
            return redirect()->route('pr.update')->with('error_message', 'failed to  update');
        }        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $check = $this->checkpermission('pr-delete');
        if ($check) {
            $this->checkpermission('pr-delete');
        } else {
            $purchase = Purchase::find($id);
            $message = $purchase->delete();
            if ($message) {
                return redirect()->route('pr.list')->with('success_message', 'Successfully Deleted');
            } else {
                return redirect()->route('pr.update')->with('error_message', 'Failed to  Delete');
            }
        }
    }

    public function getcustomreport(Request $request)
    {
        $start = $request->start;
        $end = $request->end;
        $report = Purchase::join('bahanmros', 'bahanmros.id', 'prs.bahanmros_id')
                    ->join('suppliers', 'suppliers.id', '=', 'purchases.supplier_id')
                    ->join('requestfps', 'requestfps.id', '=', 'purchases.requestfp_id')
                    ->select('purchases.*', 'bahanmros.partname', 'suppliers.suppliername','requestfps.norfps')
                    ->whereBetween('purchases.issue_date', [$start, $end])
                    ->get();
        $pdf = PDF::loadview('backend.pdfbill.allreport', compact('report', 'start', 'end'));
        return $pdf->download('prreport.pdf');
    }

    public function completedUpdateMtn($id)
    {
        $purchase = Purchase::find($id);

        $purchase->update(['status' =>'1']);


        // $training->Approved = 1;
       // $training->save();
        return redirect()->route('pr.list')->with('success', 'PR Approved');
    }

    public function completedUpdateFinance($id)
    {
        $purchase = Purchase::find($id);

        $purchase->update(['status' =>'2']);


        // $training->Approved = 1;
       // $training->save();
        return redirect()->route('pr.list')->with('success', 'PR Approved');
    }
    public function refreshproduct()
    {
        $requestfps = Requestfp::where('status', '=', 1)->get();
        return view('backend.pr.refreshproduct', compact('requestfps'));
    }




}
    