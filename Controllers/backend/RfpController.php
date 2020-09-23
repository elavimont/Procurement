<?php

namespace App\Http\Controllers\backend;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Requestfp;
use App\Models\Bahanmros;
use App\Models\Supplier;
use Illuminate\Support\Facades\Auth;
use Session;
use DB;


class RfpController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->checkpermission('rfp-list');
        $requestfps =DB::table('requestfps')
                ->join('bahanmros', 'requestfps.bahanmros_id', '=', 'bahanmros.id')
                ->join('suppliers', 'suppliers.id', '=', 'requestfps.supplier_id')
                ->select('requestfps.id','requestfps.norfps','bahanmros.partname','bahanmros.partnumber', 'suppliers.suppliername', 'suppliers.suppliercode', 'requestfps.minquantity', 'requestfps.maxquantity', 'requestfps.actquantity', 'requestfps.qty', 'requestfps.month', 'requestfps.use', 'requestfps.status', 'requestfps.created_by', 'requestfps.created_at')
                ->get();
        return view('backend.rfp.list', compact('requestfps', 'bahanmros','suppliers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->checkpermission('rfp-create');
        $bahanmros = Bahanmros::all();
        $suppliers = Supplier::all();
        return view('backend.rfp.create', compact('bahanmros','suppliers'));
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
            'norfps' => 'required',
            'bahanmros_id' => 'required',          
        ]);
        $message = Requestfp::create([
            'norfps' => $request->norfps,
            'bahanmros_id' => $request->bahanmros_id,
            'minquantity' => $request->minquantity,
            'maxquantity' => $request->maxquantity,
            'actquantity' => $request->actquantity,
            'qty' => $request->qty,
            'month' => $request->month,
            'use' => $request->use,
            'supplier_id' => $request->supplier_id,
            'status' => $request->status,   
            'created_by' => Auth::user()->username,
            'created_at' => date('Y-m-d H:i:s'),
        ]);
        if ($message) {
            return redirect()->route('rfp.list')->with('success_message', 'successfully created ');
        } else {
            return redirect()->route('rfp.create')->with('error_message', 'Failed To create');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $this->checkpermission('rfp-edit');
        $requestfps = Requestfp::find($id);
        $bahanmros = Bahanmros::all();
        $suppliers = Supplier::all();
        return view('backend.rfp.edit', compact('requestfps', 'bahanmros','suppliers'));
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        DB::table('requestfps')->where('id',$request->id)->update([
        'norfps' => $request->norfps,
        'bahanmros_id' => $request->bahanmros_id,
        'minquantity' => $request->minquantity,
        'maxquantity' => $request->maxquantity,
        'actquantity' => $request->actquantity,
        'qty' => $request->qty,
        'month' => $request->month,
        'use' => $request->use,
        'supplier_id' => $request->supplier_id,
        'modified_by' => Auth::user()->username,
        'updated_at' => date('Y-m-d H:i:s')
        ]);
            return redirect()->route('rfp.list')->with('success_message', 'successfully updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
     

    public function destroy($id)
    {
        $check = $this->checkpermission('rfp-delete');
        if ($check) {
            $this->checkpermission('rfp-delete');
        } else {
            $requestfps = Requestfp::find($id);
            $message = $requestfps->delete();
            if ($message) {
                return redirect()->route('rfp.list')->with('success_message', 'successfully Deleted');
            } else {
                return redirect()->route('rfp.update')->with('error_message', 'failed to  Delete');
            }
        }
    }

    public function completedUpdate($id)
    {
        $requestfps = Requestfp::find($id);
        $requestfps->update(['status' =>'1']);
        // $training->Approved = 1;
       // $training->save();
        return redirect()->route('rfp.list')->with('success', 'PR Approved');
    }
}
