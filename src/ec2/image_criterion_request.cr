private alias Core = Amazonite::Core

module Amazonite::EC2
  # The criteria that are evaluated to determine which AMIs are discoverable and usable in your
  # account for the specified Amazon Web Services Region.
  #
  # The `ImageCriteria` can include up to:
  #
  # - 10 `ImageCriterion`
  #
  # Each `ImageCriterion` can include up to:
  #
  # - 200 values for `ImageProviders`
  #
  # - 50 values for `ImageNames`
  #
  # - 50 values for `MarketplaceProductCodes`
  #
  # - 50 values for `ImageWatermarks`
  #
  # For more information, see [How Allowed AMIs
  # works](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-allowed-amis.html#how-allowed-amis-works)
  # in the *Amazon EC2 User Guide*.
  class ImageCriterionRequest
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
    # - 12-digit account ID: Allow AMIs created by the specified accounts. One or more account IDs can
    # be specified.
    #
    # - `none`: Allow AMIs created by your own account only. When `none` is specified, no other values
    # can be specified.
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
    property deprecation_time_condition : DeprecationTimeConditionRequest | Nil

    # The maximum age for allowed images.
    property creation_date_condition : CreationDateConditionRequest | Nil

    # The watermark criteria that an AMI must match to be allowed. An AMI is allowed if it carries at
    # least one watermark that satisfies an ImageWatermarkFilter. A watermark satisfies a filter when
    # all specified fields in the ImageWatermarkFilter match the corresponding values on the watermark
    # of the AMI.
    #
    # Maximum: 50 values
    property image_watermarks : Array(ImageWatermarkFilterRequest) | Nil

    def initialize(
      @image_providers : Array(String) | Nil = nil,
      @marketplace_product_codes : Array(String) | Nil = nil,
      @image_names : Array(String) | Nil = nil,
      @deprecation_time_condition : DeprecationTimeConditionRequest | Nil = nil,
      @creation_date_condition : CreationDateConditionRequest | Nil = nil,
      @image_watermarks : Array(ImageWatermarkFilterRequest) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@image_providers || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ImageProvider.#{i}", item}
      end

      (@marketplace_product_codes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}MarketplaceProductCode.#{i}", item}
      end

      (@image_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ImageName.#{i}", item}
      end

      if value = @deprecation_time_condition
        params.concat(value.to_query_params("#{prefix}DeprecationTimeCondition."))
      end

      if value = @creation_date_condition
        params.concat(value.to_query_params("#{prefix}CreationDateCondition."))
      end

      (@image_watermarks || [] of ImageWatermarkFilterRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ImageWatermark.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_providers: node.xpath_nodes("*[local-name()='ImageProvider']/*[local-name()='item']").map { |n| n.content },
        marketplace_product_codes: node.xpath_nodes("*[local-name()='MarketplaceProductCode']/*[local-name()='item']").map { |n| n.content },
        image_names: node.xpath_nodes("*[local-name()='ImageName']/*[local-name()='item']").map { |n| n.content },
        deprecation_time_condition: node.xpath_node("*[local-name()='DeprecationTimeCondition']").try { |n| DeprecationTimeConditionRequest.from_xml(n) },
        creation_date_condition: node.xpath_node("*[local-name()='CreationDateCondition']").try { |n| CreationDateConditionRequest.from_xml(n) },
        image_watermarks: node.xpath_nodes("*[local-name()='ImageWatermark']/*[local-name()='item']").map { |n| ImageWatermarkFilterRequest.from_xml(n) },
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
