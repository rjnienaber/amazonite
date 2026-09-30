private alias Core = Amazonite::Core

module Amazonite::EC2
  # The criteria that are evaluated to determine which AMIs are discoverable and usable in your
  # account for the specified Amazon Web Services Region.
  #
  # For more information, see [How Allowed AMIs
  # works](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-allowed-amis.html#how-allowed-amis-works)
  # in the *Amazon EC2 User Guide*.
  class ImageCriterion
    # The image providers whose images are allowed.
    #
    # Possible values:
    #
    # - `amazon`: Allow AMIs created by Amazon or verified providers.
    #
    # - `aws-marketplace`: Allow AMIs created by verified providers in the Amazon Web Services
    # Marketplace.
    #
    # - `aws-backup-vault`: Allow AMIs created by Amazon Web Services Backup.
    #
    # - 12-digit account ID: Allow AMIs created by this account. One or more account IDs can be
    # specified.
    #
    # - `none`: Allow AMIs created by your own account only.
    #
    # Maximum: 200 values
    property image_providers : Array(String) | Nil

    # The Amazon Web Services Marketplace product codes for allowed images.
    #
    # Length: 1-25 characters
    #
    # Valid characters: Letters (`A–Z, a–z`) and numbers (`0–9`)
    #
    # Maximum: 50 values
    property marketplace_product_codes : Array(String) | Nil

    # The names of allowed images. Names can include wildcards (`?` and `*`).
    #
    # Length: 1–128 characters. With `?`, the minimum is 3 characters.
    #
    # Valid characters:
    #
    # - Letters: `A–Z, a–z`
    #
    # - Numbers: `0–9`
    #
    # - Special characters: `( ) [ ] . / - ' @ _ * ?`
    #
    # - Spaces
    #
    # Maximum: 50 values
    property image_names : Array(String) | Nil

    # The maximum period since deprecation for allowed images.
    property deprecation_time_condition : DeprecationTimeCondition | Nil

    # The maximum age for allowed images.
    property creation_date_condition : CreationDateCondition | Nil

    # The watermark criteria that an AMI must match to be allowed. An AMI is allowed if it carries at
    # least one watermark that satisfies an ImageWatermarkFilter. A watermark satisfies a filter when
    # all specified fields in the ImageWatermarkFilter match the corresponding values on the watermark
    # of the AMI.
    #
    # Maximum: 50 values
    property image_watermarks : Array(ImageWatermarkFilterResponse) | Nil

    def initialize(
      @image_providers : Array(String) | Nil = nil,
      @marketplace_product_codes : Array(String) | Nil = nil,
      @image_names : Array(String) | Nil = nil,
      @deprecation_time_condition : DeprecationTimeCondition | Nil = nil,
      @creation_date_condition : CreationDateCondition | Nil = nil,
      @image_watermarks : Array(ImageWatermarkFilterResponse) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@image_providers || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ImageProviderSet.#{i}", item}
      end

      (@marketplace_product_codes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}MarketplaceProductCodeSet.#{i}", item}
      end

      (@image_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ImageNameSet.#{i}", item}
      end

      if value = @deprecation_time_condition
        params.concat(value.to_query_params("#{prefix}DeprecationTimeCondition."))
      end

      if value = @creation_date_condition
        params.concat(value.to_query_params("#{prefix}CreationDateCondition."))
      end

      (@image_watermarks || [] of ImageWatermarkFilterResponse).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ImageWatermarkSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_providers: node.xpath_nodes("*[local-name()='imageProviderSet']/*[local-name()='item']").map { |n| n.content },
        marketplace_product_codes: node.xpath_nodes("*[local-name()='marketplaceProductCodeSet']/*[local-name()='item']").map { |n| n.content },
        image_names: node.xpath_nodes("*[local-name()='imageNameSet']/*[local-name()='item']").map { |n| n.content },
        deprecation_time_condition: node.xpath_node("*[local-name()='deprecationTimeCondition']").try { |n| DeprecationTimeCondition.from_xml(n) },
        creation_date_condition: node.xpath_node("*[local-name()='creationDateCondition']").try { |n| CreationDateCondition.from_xml(n) },
        image_watermarks: node.xpath_nodes("*[local-name()='imageWatermarkSet']/*[local-name()='item']").map { |n| ImageWatermarkFilterResponse.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @deprecation_time_condition
        value.validate!
      end

      if value = @creation_date_condition
        value.validate!
      end

      if value = @image_watermarks
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@image_providers, @marketplace_product_codes, @image_names, @deprecation_time_condition, @creation_date_condition, @image_watermarks)
  end
end
