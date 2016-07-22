class ProductImporter

  attr_reader :input_url
  attr_accessor :merchant, :brand, :name, :image, :canonical_url

  def initialize(input_url)
    @input_url = input_url
  end

  def import
    get_merchant
    get_properties
  end

  def get_merchant
    # do string manipulation to figure out what merchant it is
  end

  def get_properties
    # get the product attributes accordingly
    page = RestClient.get(input_url)
    data = Nokogiri::HTML(page)
    # if amazon


    # if sephora!!!!

    # grab product image
    @image = data.css("[property='og:image']")[0].attribute('content').value

    # grab canonical url element
    @canonical_url = data.css("[property='og:url']")[0].attribute('content').value



  end

end
