<?php

namespace App\Http\Controllers\backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use  App\Models\Detailpo;
use Illuminate\Support\Facades\Auth;
use Session;


class DetailpoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->checkpermission('detailpo-list');
        $detailpo = Detailpo::all();
        return view('backend.detailpo.list',compact('detailpos'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->checkpermission('detailpo-create');
        return view('backend.detailpo.create');
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
            'name' => 'required',
            'slug' => 'required',
        ]);
        $message = Detailpo::create([
            'name' => $request->name,
            'slug' => $request->slug,
            'status' => $request->status,
            'created_by' => Auth::user()->username,
            'created_at' => date('Y-m-d H:i:s'),
        ]);
        if ($message) {
            return redirect()->route('detailpo.list')->with('success_message', 'successfully created ');
        } else {
            return redirect()->route('detailpo.create')->with('error_message', 'Failed To create');
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
        $this->checkpermission('detailpo-edit');
        $detailpo = Detailpo::find($id);
        return view('backend.detailpo.edit',compact('detailpos'));
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
            'name' => 'required',
            'slug' => 'required',
        ]);
        $pc = Detailpo::find($id);
        $pc->name = $request->name;
        $pc->slug = $request->slug;
        $pc->status = $request->status;
        $pc->modified_by = Auth::user()->username;
        $pc->updated_at = date('Y-m-d H:i:s');
        $message = $pc->update();
        if ($message) {
            return redirect()->route('detailpo.list')->with('success_message', 'successfully updated');
        } else {
            return redirect()->route('detailpo.update')->with('error_message', 'failed to  update');
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
        $check = $this->checkpermission('detailpo-delete');
        if ($check) {
            $this->checkpermission('detailpo-delete');
        } else {
            $detailpo = Detailpo::find($id);
            $message = $detailpo->delete();
            if ($message) {
                return redirect()->route('detailpo.list')->with('success_message', 'successfully Deleted');
            } else {
                return redirect()->route('detailpo.update')->with('error_message', 'failed to  Delete');
            }
        }
    }
}
