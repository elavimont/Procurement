<?php

namespace App\Http\Controllers\backend;

use App\Models\Bahanmros;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class BahanMROController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $this->checkpermission('bahanmro-list');
        $bahanmros = Bahanmros::all();
        return view('backend.bahanmro.list',compact('bahanmros'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->checkpermission('bahanmro-create');
        $bahanmros = Bahanmros::all();
        return view('backend.bahanmro.create', compact('bahanmros'));
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
            'partname' => 'required',
          
            
        ]);
        $message = Bahanmros::create([
            'partname' => $request->partname,
            'partnumber' => $request->partnumber,
           
            'partcategory' => $request->partcategory,
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
        return view('backend.bahanmro.edit', compact('bahanmros'));
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
            'partname' => 'required',
            'partnumber' => 'required',
        ]);
        $pc = Bahanmros::find($id);
        $pc->partname = $request->partname;
        $pc->partnumber = $request->partnumber;
        
        $pc->partcategory = $request->partcategory;

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
                return redirect()->route('bahanmro.list')->with('success_message', 'successfully deleted');
            } else {
                return redirect()->route('bahanmro.update')->with('error_message', 'failed to delete');
            }
        }
    }

   

}
