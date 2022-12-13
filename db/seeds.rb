Product.create!([
  {name: "mouse", price: "23.0", image_url: "https://m.media-amazon.com/images/I/61UxfXTUyvL.jpg", description: "use this with your pc", inventory: nil},
  {name: "mouse", price: "23.0", image_url: "https://m.media-amazon.com/images/I/61UxfXTUyvL.jpg", description: "use this with your pc", inventory: nil},
  {name: "monitor", price: "500.0", image_url: "https://www.lg.com/us/images/monitors/md06064916/gallery/desktop-03.jpg", description: "view your stuff", inventory: nil},
  {name: "hackey sack", price: "4.0", image_url: "https://worldfootbag.com/shop/wp-content/uploads/2011/05/Sipa-Sipa-Rasta-Main.jpg", description: "use this to hack some sack.", inventory: nil},
  {name: "hackey sack", price: "4.0", image_url: "https://worldfootbag.com/shop/wp-content/uploads/2011/05/Sipa-Sipa-Rasta-Main.jpg", description: "use this to hack some sack.", inventory: nil},
  {name: "clear", price: "0.0", image_url: "", description: "", inventory: nil},
  {name: "hard drive", price: "100.0", image_url: "https://m.media-amazon.com/images/I/81yHZDfM3GL.jpg", description: "this stores data", inventory: nil},
  {name: "hard drive", price: "100.0", image_url: "https://m.media-amazon.com/images/I/81yHZDfM3GL.jpg", description: "this stores data", inventory: nil},
  {name: "keyboard", price: "50.0", image_url: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MQ052?wid=4000&hei=1800&fmt=jpeg&qlt=95&.v=1495129815011", description: "type on this", inventory: nil},
  {name: "filler", price: "200.0", image_url: "www.thisisafiller.com", description: "this is a filler", inventory: nil},
  {name: "hard drive (HDD)", price: "100.0", image_url: "https://m.media-amazon.com/images/I/81yHZDfM3GL.jpg", description: "this stores data", inventory: nil},
  {name: "filler the second", price: "159.0", image_url: "www.thisisafiller.com", description: "this is a filler again", inventory: nil},
  {name: "toy balloon", price: "25.0", image_url: nil, description: "you blow this up and then it goes pop", inventory: nil},
  {name: "coupon", price: "5.0", image_url: nil, description: "buy one get one free", inventory: nil},
  {name: "laptop", price: "1000.0", image_url: "test_url", description: "mobile laptop for your computing needs on the move", inventory: nil},
  {name: "tower pc", price: "1000.0", image_url: "test_url", description: "big ass computer for gaming", inventory: nil}
])



# images: @product.images(@product, format: :json),