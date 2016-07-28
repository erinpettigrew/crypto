class ProductImporter

  attr_reader :input_url
  attr_accessor :data, :merchant, :brand, :name, :remote_image, :hosted_image, :canonical_url

  def initialize(input_url)
    @input_url = input_url
  end

  def import
    get_properties
    process_merchant
    return_properties
  end

  def get_properties
    # check for open graph elements and set if existing
    page = RestClient.get(input_url)
    @data = Nokogiri::HTML(page)
    # need to do a nil check on any og property before calling attribute on it

    image_element = @data.css("[property='og:image']")[0]
    url_element = @data.css("[property='og:url']")[0]

    unless image_element.nil?
      @remote_image = image_element.attribute('content').value
    end

    unless url_element.nil?
      @canonical_url = url_element.attribute('content').value
    end
  end

  def process_merchant
    # handle specific merchant cases
    if @input_url.include?("amazon.com")
      @merchant = "Amazon"
      @canonical_url = @data.css('link[rel=canonical]')[0].attribute('href').value
      set_amazon_properties
      return
    end

    unless @canonical_url.nil?
      if @canonical_url.include?("www.sephora.com")
        @merchant = "Sephora"
        set_sephora_properties
      end

      if @canonical_url.include?("www.ulta.com")
        @merchant = "Ulta"
        set_ulta_properties
      end
    end

    # handle general merchant case
    if @remote_image.nil?
      set_general_properties
    end
  end

  def set_amazon_properties
    asin_start = canonical_url.index('/dp/') + 4
    asin = canonical_url.slice(asin_start..-1)
    @brand = @data.css('#mbc').attribute('data-brand').value
  end

  def set_sephora_properties
    brand_element = @data.css('#product-content')
    @brand = brand_element.attribute('data-brand').value
    info_element = data.css('title').text
    brand_and_name = info_element.reverse!
    index = brand_and_name.index(' - ') + 3
    name = brand_and_name.slice!(index..-1)
    @name = name.reverse!
  end

  def set_ulta_properties
    brand_element = @data.css("[property='og:brand']")[0]
    @brand = brand_element.attribute('content').value
    name_element = @data.css('h1').text
    @name = name_element.gsub("\r","").gsub("\n", "").gsub("\t", "")
    @remote_image = "http:" + @remote_image # fix Ulta image location
  end

  def set_general_properties
    # grab a bunch of images to display for user to select from
    @remote_image = []
    images = @data.css('img') # array of all images
    images.each do |image|
      unless image.attribute('src').nil?
        @remote_image << image.attribute('src').value
      end
    end
  end

  def return_properties
    { product_brand: @brand,
      product_name: @name,
      image: @remote_image,
      category_id: 1
    }
  end

end
