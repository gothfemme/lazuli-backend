# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
posts = [
    { user_id: 1,
      title: "Placeholder",
      image: "https://images.unsplash.com/photo-1540096390300-b35746976457?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e190b6c1bbfa9a08ed9dac038805aed4&auto=format&fit=crop&w=1950&q=80",
      content: "Tumblr chartreuse tbh vinyl iPhone. Chillwave church-key paleo quinoa post-ironic blog readymade VHS, enamel pin edison bulb austin blue bottle. Aesthetic enamel pin copper mug, raw denim crucifix YOLO hexagon la croix fingerstache tumblr taiyaki ramps drinking vinegar banjo umami. Portland quinoa shoreditch kombucha artisan 3 wolf moon marfa pop-up kogi jean shorts blog actually farm-to-table. Glossier fam meggings venmo, DIY VHS biodiesel poutine everyday carry cloud bread raclette taxidermy skateboard man bun. Wolf banh mi meggings truffaut hashtag polaroid locavore chillwave street art distillery cloud bread."
    },
    { user_id: 1,
      title: "Text Post!",
      image: "",
      content: "Jianbing echo park beard, locavore enamel pin photo booth leggings gluten-free vinyl lomo occupy poke af bushwick knausgaard. Wayfarers helvetica chambray slow-carb authentic edison bulb. Biodiesel cloud bread cronut viral ramps seitan, venmo put a bird on it twee beard. Vegan lo-fi 8-bit intelligentsia authentic echo park tilde meggings roof party yr. Craft beer meh man bun, sriracha master cleanse hot chicken authentic you probably haven't heard of them freegan fingerstache bushwick bespoke post-ironic adaptogen single-origin coffee."
    },
    { user_id: 1,
      title: "Another Image",
      image: "https://images.unsplash.com/photo-1504194921103-f8b80cadd5e4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=794691cc020e7d15205ebc98a675117a&auto=format&fit=crop&w=2100&q=80",
      content: "Bitters af leggings, small batch palo santo typewriter ethical flexitarian photo booth lyft VHS bespoke listicle."}
  ]

  user = User.create(email: "k@gothfem.me", username: "gothfemme", avatar:"gothfemmeglitch1.png", password:"password", password_confirmation:"password", admin: true)

  posts.each { |post|
    new_post = Post.create(post)
    UserPost.create(post: new_post, user: user)
  }
