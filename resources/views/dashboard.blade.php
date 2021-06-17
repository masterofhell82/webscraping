@extends('layouts.app')

@section('content')
	<div class="row">
		<div class="col">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						Bienvenido {{ auth()->user()->name }}
					</h3>
				</div>
			</div>
		</div>
		<div class="col-2">
			<form class="float-right" method="POST" action="{{ route('logout') }}">
				{{ csrf_field() }}
				<button class="btn btn-outline-danger btn-sm">Cerrar sesión</button>
			</form>
		</div>
	</div>
	<div class="row p-3">
		<p class="float-right"> Sraping realizada en la www.anundos.com</p>
		<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Nombre</th>
		      <th scope="col">Comentario</th>
		      <th scope="col">Acción	</th>
		    </tr>
		  </thead>
		  <tbody>

		   	@foreach($categories as $key => $cat)
		   	<tr>
		      <th scope="row">{{ $key + 1}}</th>
		      <td>{{ $cat -> name }}</td>
		      <td>{{ $cat -> comment }}</td>
		      <td>
		      	<button class="btn btn-info btn-sm data-toggle="modal" data-target="#exampleModal"">
		      		Sub Categorias
		      	</button>
		      </td>
		    </tr>
		    @endforeach

		  </tbody>
		</table>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
@endsection