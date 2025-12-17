# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# IMPORTANT: Do NOT add Administrator data here!
# Administrator accounts should be created manually by user.
# This seeds file is only for application data (products, categories, etc.)

require 'open-uri'

puts "🏎️  Starting Ferrari Motors seed data..."

# Clean existing data
puts "Cleaning existing data..."
FerrariCar.destroy_all
Category.destroy_all

# Create Categories
puts "\n📁 Creating categories..."

categories = [
  {
    name: "سيارات رياضية",
    description: "سيارات فيراري الرياضية الأيقونية بأداء استثنائي وتصميم انسيابي"
  },
  {
    name: "هايبرد",
    description: "تكنولوجيا هجينة متطورة تجمع بين الأداء والكفاءة"
  },
  {
    name: "جران توريزمو",
    description: "سيارات سياحية فاخرة للرحلات الطويلة بأقصى درجات الراحة"
  },
  {
    name: "إصدار محدود",
    description: "نماذج حصرية ونادرة للمقتنين والعشاق"
  }
]

categories.each do |cat_data|
  category = Category.create!(cat_data)
  puts "  ✓ Created category: #{category.name}"
end

# Create Ferrari Cars with Unsplash images
puts "\n🚗 Creating Ferrari cars..."

ferrari_cars_data = [
  {
    name: "Ferrari SF90 Stradale",
    model: "SF90",
    year: 2024,
    price: 625000,
    description: "أول سيارة هجينة من فيراري بقوة 1000 حصان. تجمع بين محرك V8 بشاحن توربيني وثلاثة محركات كهربائية لتحقيق أداء استثنائي. نظام الدفع الرباعي يوفر تحكماً مثالياً على الطريق.\n\nتصميم خارجي ثوري مستوحى من سيارات الفورمولا 1، مع ديناميكيات هوائية متقدمة. داخلية فاخرة بأحدث التقنيات الرقمية وشاشات عالية الدقة.",
    engine: "V8 Twin-Turbo Hybrid",
    top_speed: 340,
    acceleration: 2.5,
    status: "available",
    category: "هايبرد",
    image_url: "https://images.unsplash.com/photo-1583121274602-3e2820c69888?w=1200&h=800&fit=crop"
  },
  {
    name: "Ferrari F8 Tributo",
    model: "F8",
    year: 2024,
    price: 280000,
    description: "تكريم لأفضل محركات V8 في تاريخ فيراري. تصميم انسيابي مذهل يجمع بين الأداء والأناقة. محرك V8 بقوة 720 حصاناً يوفر تجربة قيادة لا تُنسى.\n\nتقنيات متطورة من عالم السباقات، مع نظام تعليق ديناميكي وفرامل كربونية متطورة. وزن خفيف وتوزيع مثالي للكتلة.",
    engine: "V8 Twin-Turbo",
    top_speed: 340,
    acceleration: 2.9,
    status: "available",
    category: "سيارات رياضية",
    image_url: "https://images.unsplash.com/photo-1592198084033-aade902d1aae?w=1200&h=800&fit=crop"
  },
  {
    name: "Ferrari 812 Superfast",
    model: "812",
    year: 2024,
    price: 365000,
    description: "محرك V12 الأسطوري بقوة 800 حصان في تصميم كوبيه كلاسيكي. أقوى وأسرع سيارة فيراري إنتاجية على الإطلاق. صوت المحرك الفريد يعكس تراث فيراري العريق.\n\nتصميم إيطالي راقي مع خطوط عضلية أنيقة. نظام توجيه محسّن للاستجابة الفورية ودقة قيادة استثنائية.",
    engine: "V12 Naturally Aspirated",
    top_speed: 340,
    acceleration: 2.8,
    status: "available",
    category: "جران توريزمو",
    image_url: "https://images.unsplash.com/photo-1544636331-e26879cd4d9b?w=1200&h=800&fit=crop"
  },
  {
    name: "Ferrari Roma",
    model: "Roma",
    year: 2024,
    price: 243000,
    description: "كوبيه رياضية أنيقة مستوحاة من روما الأبدية. تصميم كلاسيكي حديث يعيد أمجاد الستينيات. محرك V8 بشاحن توربيني بقوة 620 حصاناً.\n\nداخلية فاخرة بمواد عالية الجودة وتقنيات متطورة. مقصورة هادئة ومريحة مثالية للرحلات الطويلة مع أداء رياضي متميز.",
    engine: "V8 Twin-Turbo",
    top_speed: 320,
    acceleration: 3.4,
    status: "available",
    category: "جران توريزمو",
    image_url: "https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=1200&h=800&fit=crop"
  },
  {
    name: "Ferrari 296 GTB",
    model: "296",
    year: 2024,
    price: 321000,
    description: "محرك V6 هجين جديد كلياً يعيد تعريف الأداء. قوة 830 حصاناً من وحدة محرك مدمجة. تقنية هجينة تسمح بالقيادة الكهربائية الصامتة.\n\nتصميم متطور بخطوط ديناميكية حادة. أول محرك V6 في تاريخ فيراري الحديث، مع وزن أخف وتوزيع مثالي.",
    engine: "V6 Hybrid",
    top_speed: 330,
    acceleration: 2.9,
    status: "available",
    category: "هايبرد",
    image_url: "https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=1200&h=800&fit=crop"
  },
  {
    name: "Ferrari Purosangue",
    model: "Purosangue",
    year: 2024,
    price: 398000,
    description: "أول سيارة رباعية الأبواب من فيراري. تجمع بين الأداء الرياضي والعملية اليومية. محرك V12 طبيعي الشفط بقوة 725 حصاناً.\n\nمساحة داخلية واسعة لأربعة ركاب بالغين، مع فخامة استثنائية. نظام تعليق نشط لراحة فائقة مع أداء ديناميكي رياضي.",
    engine: "V12 Naturally Aspirated",
    top_speed: 310,
    acceleration: 3.3,
    status: "available",
    category: "جران توريزمو",
    image_url: "https://images.unsplash.com/photo-1617531653332-bd46c24f2068?w=1200&h=800&fit=crop"
  },
  {
    name: "Ferrari LaFerrari",
    model: "LaFerrari",
    year: 2023,
    price: 1500000,
    description: "أيقونة فيراري الهجينة الأسطورية. قوة 963 حصاناً من محرك V12 ومحرك كهربائي. إصدار محدود للغاية بـ 499 وحدة فقط حول العالم.\n\nتقنيات الفورمولا 1 المطبقة على سيارة طريق. تصميم انسيابي فائق يجمع بين الجمال والكفاءة الهوائية. قطعة فنية متحركة.",
    engine: "V12 Hybrid (HY-KERS)",
    top_speed: 350,
    acceleration: 2.4,
    status: "sold",
    category: "إصدار محدود",
    image_url: "https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?w=1200&h=800&fit=crop"
  },
  {
    name: "Ferrari Portofino M",
    model: "Portofino M",
    year: 2024,
    price: 245000,
    description: "كابريوليه أنيقة بسقف قابل للطي. مثالية للقيادة في الطقس الجميل والاستمتاع بصوت المحرك. محرك V8 محسّن بقوة 620 حصاناً.\n\nداخلية فاخرة بأربعة مقاعد. نظام ترس ثماني السرعات للراحة والأداء. تجمع بين الرياضية والفخامة اليومية.",
    engine: "V8 Twin-Turbo",
    top_speed: 320,
    acceleration: 3.4,
    status: "available",
    category: "سيارات رياضية",
    image_url: "https://images.unsplash.com/photo-1580274455191-1c62238fa333?w=1200&h=800&fit=crop"
  },
  {
    name: "Ferrari Daytona SP3",
    model: "Daytona SP3",
    year: 2023,
    price: 2300000,
    description: "إصدار خاص من سلسلة Icona. مستوحاة من سيارات السباق الأسطورية في الستينيات. محرك V12 طبيعي الشفط بقوة 840 حصاناً.\n\nتصميم تارغا مفتوح فريد من نوعه. 599 وحدة فقط حول العالم. مصنوعة يدوياً بأعلى معايير الحرفية الإيطالية.",
    engine: "V12 Naturally Aspirated",
    top_speed: 340,
    acceleration: 2.85,
    status: "reserved",
    category: "إصدار محدود",
    image_url: "https://images.unsplash.com/photo-1511919884226-fd3cad34687c?w=1200&h=800&fit=crop"
  },
  {
    name: "Ferrari F8 Spider",
    model: "F8 Spider",
    year: 2024,
    price: 310000,
    description: "نسخة المكشوفة من F8 Tributo. سقف قابل للطي يفتح في 14 ثانية فقط. نفس أداء الكوبيه مع متعة القيادة المكشوفة.\n\nتصميم هيكلي متطور يحافظ على الصلابة. تقنيات تحكم إلكترونية متقدمة. تجربة سمعية لا تُنسى مع صوت V8 النقي.",
    engine: "V8 Twin-Turbo",
    top_speed: 340,
    acceleration: 2.9,
    status: "available",
    category: "سيارات رياضية",
    image_url: "https://images.unsplash.com/photo-1542362567-b07e54358753?w=1200&h=800&fit=crop"
  },
  {
    name: "Ferrari 812 GTS",
    model: "812 GTS",
    year: 2024,
    price: 404000,
    description: "أقوى سيارة مكشوفة في تاريخ فيراري. محرك V12 بقوة 800 حصان مع سقف قابل للطي. الجمع المثالي بين الأداء الخام والهواء الطلق.\n\nصوت V12 النقي بدون حواجز. تصميم معدل للحفاظ على الديناميكيات الهوائية. لحظات لا تُنسى على الطرقات المفتوحة.",
    engine: "V12 Naturally Aspirated",
    top_speed: 340,
    acceleration: 3.0,
    status: "available",
    category: "جران توريزمو",
    image_url: "https://images.unsplash.com/photo-1614200187524-dc4b892acf16?w=1200&h=800&fit=crop"
  },
  {
    name: "Ferrari SF90 Spider",
    model: "SF90 Spider",
    year: 2024,
    price: 670000,
    description: "النسخة المكشوفة من SF90 Stradale. قوة 1000 حصان مع متعة القيادة المفتوحة. تقنية هجينة متطورة في تصميم سبايدر.\n\nسقف قابل للطي بآلية كهربائية متقدمة. نفس الأداء الاستثنائي مع وزن إضافي ضئيل. تجربة قيادة مستقبلية.",
    engine: "V8 Twin-Turbo Hybrid",
    top_speed: 340,
    acceleration: 2.5,
    status: "available",
    category: "هايبرد",
    image_url: "https://images.unsplash.com/photo-1610768764270-790fbec18178?w=1200&h=800&fit=crop"
  }
]

ferrari_cars_data.each_with_index do |car_data, index|
  category = Category.find_by(name: car_data[:category])
  
  # Attach image from Unsplash
  begin
    car = FerrariCar.create!(
      name: car_data[:name],
      model: car_data[:model],
      year: car_data[:year],
      price: car_data[:price],
      description: car_data[:description],
      engine: car_data[:engine],
      top_speed: car_data[:top_speed],
      acceleration: car_data[:acceleration],
      status: car_data[:status],
      category: category,
      image: { io: URI.open(car_data[:image_url]), filename: "#{car_data[:name].parameterize}.jpg" }
    )
    puts "  ✓ Created: #{car.name} (with image)"
  rescue => e
    puts "  ✓ Created: #{car.name} (image failed: #{e.message})"
  end
  
  # Small delay to avoid rate limiting
  sleep(0.5) if index < ferrari_cars_data.length - 1
end

puts "\n✅ Seed data completed successfully!"
puts "   - #{Category.count} categories created"
puts "   - #{FerrariCar.count} Ferrari cars created"
puts "\n🏁 Ferrari Motors is ready!"
