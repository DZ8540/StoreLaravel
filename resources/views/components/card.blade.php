<div class="col-sm-6 col-md-4">
  <div class="thumbnail">
      <div class="labels">


                  </div>
      <img src="http://internet-shop.tmweb.ru/storage/products/iphone_x.jpg" alt="iPhone X 64GB">
      <div class="caption">
          <h3>{{ $product->name }}</h3>
          <p>{{ $product->price }} ₽</p>
          {{ $product->category->name }}
          <p>
            <form action="{{ route('cart.add', $product) }}" method="POST">
              <button type="submit" class="btn btn-primary" role="button">В корзину</button>
              <a href="{{ route('product', [$product->category->code, $product->code]) }}" class="btn btn-default"
                 role="button">Подробнее</a>
              @csrf
          </form>
          </p>
      </div>
  </div>
</div>
