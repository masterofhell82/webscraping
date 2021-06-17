@extends('layouts.app')



@section('content')
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-header">
					<h3 class="panel-title">
						Acceso a la Aplicación
					</h3>
				</div>
				<div class="card-body">
					<form method="POST" action="{{ route('login') }}">
						{{ csrf_field() }}
						<div class="form-group {{ $errors -> has('email') ? 'invalid' : '' }}">
							<label for="email">Email</label>
							<input 
								class="form-control" 
							    type="email"
							    value="{{ old('email') }}" 
							    name="email" 
							    placeholder="Ingresa tu Email">
							{!! $errors -> first('email', '<span class="help-block">:message</span>') !!}
						</div>
						<div class="form-group {{ $errors -> has('password') ? 'invalid' : '' }}">
							<label for="email">Contraseña</label>
							<input 
								class="form-control"
							    type="password" 
							    name="password" 
							    placeholder="Ingresa tu Contraseña">
							{!! $errors -> first('password', '<span class="help-block">:message</span>') !!}
						</div>
						<button class="btn btn-primary btn-block">Acceder</button>
					</form>
				</div>
			</div>
		</div>
	</div>


@endsection