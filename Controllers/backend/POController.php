<?php

namespace App\Http\Controllers\backend;

use App\Models\Pr;
use App\Models\Po;
use App\Models\Supplier;

use App\Models\Bahanmros;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Session;
use PDF;
use Datatables;

class POController extends Controller
{
    public function create($id)
    {
        $this->checkpermission('po-list');
        $prs = Pr::find($id); 
        $pos = Po::all();
        $bahanmros = Bahanmros::all();
        $suppliers = Supplier::all();
        return view('backend.po.create', compact('pos','prs', 'suppliers','bahanmros'));
    }


    public function store(Request $request)
    {
         $this->validate($request, [
            'nopo' => 'required',
            
        ]);
        $message = Po::create([
            'supplier_id' => $request->supplier_id,
            'nopo' => $request->nopo,
            'nopr' => $request->nopr,
            'pr_id' => $request->pr_id,

            'bahanmros_id' => $request->bahanmros_id,
            
            'issue_date' => $request->issue_date,
            'delivery_date' => $request->delivery_date,
            'qty' => $request->qty,
            'price' => $request->price,
            'total_price' => $request->qty * $request->price,
            'created_by' => Auth::user()->username,
            'created_at' => date('Y-m-d H:i:s'),          
        ]);
        if ($message) {
            return redirect()->route('po.list')->with('success_message', 'successfully created ');
        } else {
            return redirect()->route('po.create')->with('error_message', 'Failed To create');
        }
    }

    public function index()
    {
        $this->checkpermission('po-list');
        $pos =DB::table('pos')
                ->join('prs', 'pos.pr_id', '=', 'prs.id')
                ->join('suppliers', 'suppliers.id', '=', 'pos.supplier_id')
                ->join('bahanmros', 'bahanmros.id', '=', 'pos.bahanmros_id')

            ->get();   
        $pos = Po::all();
        return view('backend.po.list', compact('pos','suppliers', 'prs', 'bahanmros'));
    }

    public function edit($id)
    {
        $this->checkpermission('po-edit');
        $pos = Po::find($id);
        $prs = Prs::all();
        $bahanmros = Bahanmros::all();

        return view('backend.po.edit', compact('pos', 'prs','bahanmros'));
    }

        public function update(Request $request, $id)
    {
         DB::table('pos')->where('id',$request->id)->update([

        'issue_date' => $request->issue_date,
        'delivery_date' => $request->delivery_date,
        'qty' => $request->qty,
        'price' => $request->price,
        'total_price' => $request->qty * $request->price,
        'modified_by' => Auth::user()->username,
        'updated_at' => date('Y-m-d H:i:s')
        ]);
            return redirect()->route('po.list')->with('success_message', 'successfully updated');        
    }

    public function destroy($id)
    {
        $check = $this->checkpermission('po-delete');
        if ($check) {
            $this->checkpermission('po-delete');
        } else {
            $po = Po::find($id);
            $message = $po->delete();
            if ($message) {
                return redirect()->route('po.list')->with('success_message', 'successfully Deleted');
            } else {
                return redirect()->route('po.update')->with('error_message', 'failed to  Delete');
            }
        }
    }

   
    public function getcustomreport(Request $request)
    {
        $start = $request->start;
        $end = $request->end;
        $report = Po::join('bahanmros', 'bahanmros.id', 'pos.bahanmros_id')
                    ->join('suppliers', 'suppliers.id', '=', 'pos.supplier_id')
                    ->join('prs', 'prs.id', '=', 'pos.pr_id')
                   ->select('pos.*', 'bahanmros.partname', 'suppliers.suppliername','prs.nopr')
                    ->whereBetween('pos.issue_date', [$start, $end])
                    ->get();
        $pdf = PDF::loadview('backend.pdfbill.poreport', compact('report', 'start', 'end'));
        return $pdf->download('poreport.pdf');
    }

    public function getprintpo ($id)
    {
        $pos = Po::find($id); 
        $prs = Pr::all();
        $bahanmros = Bahanmros::all();

        $suppliers = Supplier::all();

        $pdf = PDF::loadview('backend.pdfbill.po', compact('prs', 'pos', 'bahanmros', 'suppliers'));
        return $pdf->download('po.pdf');
    }   
}
