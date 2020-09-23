<?php

namespace App\Http\Controllers\backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Supplier;
use Illuminate\Support\Facades\Auth;
use Session;


class SupplierController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->checkpermission('supplier-list');
        $supplier = Supplier::all();
        return view('backend.supplier.list',compact('supplier'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->checkpermission('supplier-create');
        $supplier = Supplier::all();
        return view('backend.supplier.create');
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
            'suppliername' => 'required',
            'suppliercode' => 'required',
        ]);
        $message = Supplier::create([
            'suppliername' => $request->suppliername,
            'suppliercode' => $request->suppliercode,
            'phone' => $request->phone,
            'address' => $request->address,
            'city' => $request->city,
            'kodepos' => $request->kodepos,
            'email' => $request->email,


            'created_by' => Auth::user()->username,
            'created_at' => date('Y-m-d H:i:s'),
        ]);
        if ($message) {
            return redirect()->route('supplier.list')->with('success_message', 'successfully created ');
        } else {
            return redirect()->route('supplier.create')->with('error_message', 'Failed To create');
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
        $this->checkpermission('supplier-edit');
        $supplier = Supplier::find($id);
        return view('backend.supplier.edit',compact('supplier'));
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

         DB::table('suppliers')->where('id',$request->id)->update([
        'suppliername' => $request->suppliername,
        'suppliercode' => $request->suppliercode,
        'phone' => $request->phone,
        'address' => $request->address,
        'city' => $request->city,
        'kodepos' => $request->kodepos,
        'email' => $request->email,

        'modified_by' => Auth::user()->username,
        'updated_at' => date('Y-m-d H:i:s')
        ]);
            return redirect()->route('supplier.list')->with('success_message', 'successfully updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $check = $this->checkpermission('supplier-delete');
        if ($check) {
            $this->checkpermission('supplier-delete');
        } else {
            $supplier = Supplier::find($id);
            $message = $supplier->delete();
            if ($message) {
                return redirect()->route('supplier.list')->with('success_message', 'successfully Deleted');
            } else {
                return redirect()->route('supplier.update')->with('error_message', 'failed to  Delete');
            }
        }
    }
}
