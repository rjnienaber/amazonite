private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateFpgaImageRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The location of the encrypted design checkpoint in Amazon S3. The input must be a tarball.
    property input_storage_location : StorageLocation

    # The location in Amazon S3 for the output logs.
    property logs_storage_location : StorageLocation | Nil

    # A description for the AFI.
    property description : String | Nil

    # A name for the AFI.
    property name : String | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # Idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # The tags to apply to the FPGA image during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @input_storage_location : StorageLocation,
      @dry_run : Bool | Nil = nil,
      @logs_storage_location : StorageLocation | Nil = nil,
      @description : String | Nil = nil,
      @name : String | Nil = nil,
      @client_token : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params.concat(@input_storage_location.to_query_params("#{prefix}InputStorageLocation."))

      if value = @logs_storage_location
        params.concat(value.to_query_params("#{prefix}LogsStorageLocation."))
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        input_storage_location: node.xpath_node("*[local-name()='InputStorageLocation']").try { |n| StorageLocation.from_xml(n) }.not_nil!,
        logs_storage_location: node.xpath_node("*[local-name()='LogsStorageLocation']").try { |n| StorageLocation.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @input_storage_location
        value.validate!
      end

      if value = @logs_storage_location
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @input_storage_location, @logs_storage_location, @description, @name, @client_token, @tag_specifications)
  end
end
