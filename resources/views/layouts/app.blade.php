<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Web Scraping</title>
	
	<link rel="stylesheet" href="{{asset('css/app.css')}}">

</head>

<body>
 <div class="container-fluid p-5">
 	
 	@if( session() -> has('flash'))
 		<div class="alert alert-info">{{ section('flash') }}</div>
 	@endif

 	@yield('content')

 </div>

 <script src="{{asset('js/app.js')}}"></script>
</body>

</html>