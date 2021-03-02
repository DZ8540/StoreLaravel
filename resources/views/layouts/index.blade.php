<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Интернет Магазин: @yield('title')</title>

    <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">
    <script src="{{ asset('/static/js/jquery.min.js') }}"></script>
    <script src="{{ asset('/static/js/bootstrap.min.js') }}"></script>
    <link href="{{ asset('/static/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('/static/css/starter-template.css') }}" rel="stylesheet">
</head>
<body>
  @include('components.header')

  @if (session()->has('success'))
    <p class="alert alert-success">{{ session()->get('success') }}</p>
  @endif

  @if (session()->has('warning'))
  <p class="alert alert-warning">{{ session()->get('warning') }}</p>
  @endif

  @yield('content')
</body>
</html>
