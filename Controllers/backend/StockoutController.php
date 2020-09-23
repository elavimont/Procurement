<?php

namespace App\Http\Controllers\backend;

use App\Models\Bahanmros;
use App\Models\Stockout;
use App\Models\Salescart;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Session;
use PDF;

class StockoutController extends Controller
{
    public function create()
    {
        $this->checkpermission('stockout-create');
        $salescarts = Salescart::all();
        return view('backend.stockout.create', compact('stockouts', 'salescarts'));
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'bahanmros_id' => 'required',
            
            'stockouts_quantity' => 'required',
        ]);
        if ($request->ajax()) {
            $stockouts = new Salescart();
            $stockouts->bahanmros_id = $request->bahanmros_id;
            $stockouts->quantity = $request->stockouts_quantity;
            
            $stockouts->stockout_status = $request->stockout_status;
            $stockouts->user_name = Auth::user()->username;
            $stockouts->stockout_date = date('Y-m-d');
            if ($stockouts->save()) {
                $bahanmros = Bahanmros::find($request->bahanmros_id);
                $bahanmros->stock = $bahanmros->stock - $request->stockouts_quantity;
                if ($bahanmros->update()) {
                    return response(['success_message' => 'SuccessFully Make sales']);
                }
            }

        } else {
            return response(['error_message' => 'Filed To Make sales']);
        }
    }

    public function index()
    {
        $this->checkpermission('stockout-list');
        $stockouts = Stockout::join('bahanmros', 'bahanmros.id', '=', 'stockouts.bahanmros_id')
            ->select('stockouts.*', 'bahanmros.name')
            ->orderBy('stockouts.created_at', 'DEC')
            ->get();
        return view('backend.stockout.list', compact('stockouts'));
    }

    public function ajaxlist()
    {
        $stockouts = Salescart::join('bahanmros', 'bahanmros.id', '=', 'salescarts.bahanmros_id')
            ->select('salescarts.*', 'bahanmros.name')
            ->orderBy('salescarts.created_at', 'DEC')
            ->get();
        return view('backend.stockout.ajaxlist', compact('stockouts'));
    }

    public function ajaxform()
    {
        $salescart = Salescart::all();
        return view('backend.stockout.ajaxform', compact('salescart'));
    }

    public function refreshproduct()
    {
        $bahanmros = Bahanmros::where('stock', '>=', 1)->get();
        return view('backend.stockout.refreshproduct', compact('bahanmros'));
    }

    public function getquantity(Request $request)
    {
        $bahanmros = Bahanmros::where('id', $request->bahanmros_id)->get();
        echo $bahanmros[0]->stock;

    }


    public function getproductname(Request $request)
    {
        $bahanmros = Bahanmros::where('id', $request->bahanmros_id)->get();
        echo $bahanmros[0]->name;
    }

    public function getallpdf()
    {
        $report = Salescart::join('bahanmros', 'bahanmros.id', '=', 'salescarts.bahanmros_id')
            ->select('salescarts.*', 'bahanmros.name')
            ->get();
        return view('backend.pdfbill.salesbill', compact('report'));
    }

    public function getcustomreport(Request $request)
    {
        $start = $request->start;
        $end = $request->end;
        $report = Stockout::join('bahanmros', 'bahanmros.id', 'stockouts.bahanmros_id')
            ->select('stockouts.*', 'bahanmros.name')
            ->whereBetween('stockouts.stockout_date', [$start, $end])
            ->get();
        $pdf = PDF::loadview('backend.pdfbill.allreport', compact('report', 'start', 'end'));
        return $pdf->download('stockoutreport.pdf');
    }

    public function savetosales(Request $request)
    {
        for ($i = 0; $i < $request->input('total_product'); $i++) {
            $od = [
                'bahanmros_id' => $request['bahanmros_id'][$i],
                'quantity' => $request['quantity'][$i],
                
                'stockout_status' => $request['stockout_status'][$i],
                'user_name' => Auth::user()->username,
                'stockout_date' => date('Y-m-d'),
            ];
            Stockout::create($od);
        }
        DB::table('salescarts')->delete();
        return redirect()->back()->with('success_message', 'Successfuly Clear Your Bucket and Sales Item store in Sales Record');

    }

    public function deletecart($id, $pid)
    {
        $bahanmros = Bahanmros::find($pid);
        $salescart = Salescart::find($id);
        $bahanmros->stock = $bahanmros->stock + $salescart->quantity;
        if ($bahanmros->update()) {
            $salescart->delete();
            return redirect()->back()->with('success_message', 'Seccessfully deleted Item');
        }else {
            return redirect()->back()->with('error_messsage', 'Failed To Delete Item');
        }
    }
}
