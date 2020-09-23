<?php

namespace App\Http\Controllers\backend;


use App\Models\Mrorejected;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class MrorejectedController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $this->checkpermission('mrorejected-list');
        $mrorejecteds = Mrorejected::all();
        return view('backend.mrorejected.list', compact('mrorejecteds'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->checkpermission('bahanmro-create');
        $suppliers = Supplier::all();
        return view('backend.bahanmro.create', compact('suppliers'));
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
            'supplier_id' => 'required',
            'name' => 'required',
            'code' => 'required|unique:bahanmros',
            'quantity' => 'required',
            'limit_stock' => 'required',
            
        ]);
        $message = Bahanmros::create([
            'supplier_id' => $request->supplier_id,
            'name' => $request->name,
            'code' => $request->code,
            'quantity' => $request->quantity,
            'stock' => $request->quantity,
            'limit_stock' => $request->limit_stock,
            'status' => $request->status,
            'created_by' => Auth::user()->username,
            'created_at' => date('Y-m-d H:i:s'),
        ]);
        if ($message) {
            return redirect()->route('bahanmro.list')->with('success_message', 'successfully created ');
        } else {
            return redirect()->route('bahanmro.create')->with('error_message', 'Failed To create');
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
        $this->checkpermission('bahanmro-edit');
        $bahanmros = Bahanmros::find($id);
        $suppliers = Supplier::all();
        return view('backend.bahanmro.edit', compact('bahanmros', 'suppliers'));
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
            'supplier_id' => 'required',
            'name' => 'required',
            'code' => 'required',
            'quantity' => 'required',
            'stock' => 'required',
            'limit_stock' => 'required',
            
        ]);
        $pc = Bahanmros::find($id);
        $pc->supplier_id = $request->supplier_id;
        $pc->name = $request->name;
        $pc->code = $request->code;
        $pc->quantity = $request->quantity;
        $pc->stock = $request->stock; 
        $pc->limit_stock = $request->limit_stock; 
        $pc->status = $request->status;
        $pc->modified_by = Auth::user()->username;
        $pc->updated_at = date('Y-m-d H:i:s');
        $message = $pc->update();
        if ($message) {
            return redirect()->route('bahanmro.list')->with('success_message', 'successfully updated');
        } else {
            return redirect()->route('bahanmro.update')->with('error_message', 'failed to  update');
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
        $check = $this->checkpermission('bahanmro-delete');
        if ($check) {
            $this->checkpermission('bahanmro-delete');
        } else {
            $bahanmros = Bahanmros::find($id);
            $message = $bahanmros->delete();
            if ($message) {
                return redirect()->route('bahanmro.list')->with('success_message', 'successfully Deleted');
            } else {
                return redirect()->route('bahanmro.update')->with('error_message', 'failed to  Delete');
            }
        }
    }

    public function stockedit($id)
    {
        $bahanmros = Bahanmros::find($id);
        return view('backend.bahanmro.stockupdate', compact('bahanmros'));
    }

    public function stockupdate(Request $request, $id)
    {
        $this->validate($request, [
            'stock' => 'required',
        ]);
        $pc = Bahanmros::find($id);
        $pc->stock = $pc->stock + $request->stock;
        $pc->quantity = $pc->quantity + $request->stock;
        if ($pc->update()) {
            return redirect()->route('bahanmro.list')->with('success_message', 'successfully updated Your Stock');
        } else {
            return redirect()->route('stock.update')->with('error_message', 'failed to  update');
        }
    }
}
