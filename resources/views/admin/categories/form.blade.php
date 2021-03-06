@extends('admin.layouts.index')

@section('content')
<div class="container">
  <div class="col-md-12">
    @isset($category)
        <h1>Редактировать Категорию <b>{{ $category->name }}</b></h1>
            @else
                <h1>Добавить Категорию</h1>
            @endisset

            <form method="POST" enctype="multipart/form-data"
                  @isset($category)
                  action="{{ route('categories.update', $category) }}"
                  @else
                  action="{{ route('categories.store') }}"
                @endisset
            >
                <div>
                    @isset($category)
                        @method('PUT')
                    @endisset
                    @csrf
                    <div class="input-group row">
                        @error('code')
                          <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                        <label for="code" class="col-sm-2 col-form-label">Код: </label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="code" id="code"
                                   value="{{ old('code', isset($category) ? $category->code : null) }}">
                        </div>
                    </div>
                    <br>
                    <div class="input-group row">
                      @error('name')
                          <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                        <label for="name" class="col-sm-2 col-form-label">Название: </label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="name" id="name"
                                   value="{{ old('name', isset($category) ? $category->name : null) }}">
                        </div>
                    </div>
                    <br>
                    <div class="input-group row">
                      @error('description')
                          <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                        <label for="description" class="col-sm-2 col-form-label">Описание: </label>
                        <div class="col-sm-6">
          <textarea name="description" id="description" cols="72"
                                  rows="7">{{ old('description', isset($category) ? $category->description : null) }}</textarea>
                        </div>
                    </div>
                    <br>
                    <div class="input-group row">
                        <label for="image" class="col-sm-2 col-form-label">Картинка: </label>
                        <div class="col-sm-10">
                            <label class="btn btn-default btn-file">
                                Загрузить <input type="file" style="display: none;" name="image" id="image">
                            </label>
                        </div>
                    </div>
                    <button class="btn btn-success">Сохранить</button>
                </div>
            </form>
</div>
</div>
@endsection
