<?php

namespace App\Http\Controllers\backend;

use App\Models\Warehouse;
use App\Models\Bahanmros;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class WarehouseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->checkpermission('warehouse-list');
        $warehouse = Warehouse::join('bahanmros', 'warehouses.bahanmros_id', '=', 'bahanmros.id')
            ->select('warehouses.*', 'bahanmros.partname as n')
            ->get();
        return view('backend.warehouse.list', compact('warehouse'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->checkpermission('warehouse-create');
        $bahanmros = Bahanmros::all();
        return view('backend.warehouse.create', compact('bahanmros'));
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
            'bahanmros_id' => 'required',
            'qty' => 'required',
            'location' => 'required',
        ]);
        $message = Warehouse::create([
            'bahanmros_id' => $request->bahanmros_id,
            'qty' => $request->qty,
            'stock' => $request->quantity,
            'limit_stock' => $request->limit_stock,
            'location' => $request->location,
            'status' => $request->status,
            'created_by' => Auth::user()->username,
            'created_at' => date('Y-m-d H:i:s'),
        ]);
        if ($message) {
            return redirect()->route('warehouse.list')->with('success_message', 'successfully created ');
        } else {
            return redirect()->route('warehouse.create')->with('error_message', 'Failed To create');
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
        $this->checkpermission('warehouse-edit');
        $warehouse = Warehouse::find($id);
        $bahanmros = Bahanmros::all();
        return view('backend.warehouse.edit', compact('warehouse', 'bahanmros'));
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
            'bahanmros_id' => 'required',
            'qty' => 'required',
            'stock' => 'required',
            'location' => 'required',
        ]);
        $pc = Warehouse::find($id);
        $pc->bahanmros_id = $request->bahanmros_id;
        $pc->qty = $request->qty;
        $pc->stock = $request->stock;
        $pc->limit_stock = $request->limit_stock;
        $pc->location = $request->location;
        $pc->status = $request->status;
        $pc->modified_by = Auth::user()->username;
        $pc->updated_at = date('Y-m-d H:i:s');
        $message = $pc->update();
        if ($message) {
            return redirect()->route('warehouse.list')->with('success_message', 'successfully updated');
        } else {
            return redirect()->route('warehouse.update')->with('error_message', 'failed to  update');
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
        $check = $this->checkpermission('warehouse-delete');
        if ($check) {
            $this->checkpermission('warehouse-delete');
        } else {
            $warehouse = Warehouse::find($id);
            $message = $warehouse->delete();
            if ($message) {
                return redirect()->route('warehouse.list')->with('success_message', 'successfully deleted');
            } else {
                return redirect()->route('warehouse.update')->with('error_message', 'failed to delete');
            }
        }
    }

    public function stockedit($id)
    {
        $warehouse = Warehouse::find($id);
        return view('backend.warehouse.stockupdate', compact('warehouse'));
    }

      
   

    public function stockupdate(Request $request, $id)
    {
        $this->validate($request, [
            'stock' => 'required',
        ]);
        $pc = Warehouse::find($id);
        $pc->stock = $pc->stock + $request->stock;
        $pc->qty = $pc->qty + $request->stock;
        if ($pc->update()) {
            return redirect()->route('warehouse.list')->with('success_message', 'successfully updated your stock');
        } else {
            return redirect()->route('stock.update')->with('error_message', 'failed to  update');
        }
    }

    public function stockout($id)
    {
        $warehouse = Warehouse::find($id);
        return view('backend.warehouse.stockout', compact('warehouse'));
    }

     public function stockoutupdate(Request $request, $id)
    {
        $this->validate($request, [
            'stock' => 'required',
        ]);
        $pc = Warehouse::find($id);
        $pc->stock = $pc->stock - $request->stock;
        $pc->qty = $pc->qty - $request->stock;
        if ($pc->update()) {
            return redirect()->route('warehouse.list')->with('success_message', 'successfully updated your stock');
        } else {
            return redirect()->route('stockout.update')->with('error_message', 'failed to  update');
        }
    }

   
}
