private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # The configuration information for the bucket.
  class CreateBucketConfiguration
    # Specifies the Region where the bucket will be created. You might choose a Region to optimize
    # latency, minimize costs, or address regulatory requirements. For example, if you reside in
    # Europe, you will probably find it advantageous to create buckets in the Europe (Ireland) Region.
    #
    # If you don't specify a Region, the bucket is created in the US East (N. Virginia) Region
    # (us-east-1) by default. Configurations using the value `EU` will create a bucket in `eu-west-1`.
    #
    # For a list of the valid values for all of the Amazon Web Services Regions, see [Regions and
    # Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region).
    #
    # This functionality is not supported for directory buckets.
    property location_constraint : BucketLocationConstraint | Nil

    # Specifies the location where the bucket will be created.
    #
    # **Directory buckets ** - The location type is Availability Zone or Local Zone. To use the Local
    # Zone location type, your account must be enabled for Local Zones. Otherwise, you get an HTTP
    # `403 Forbidden` error with the error code `AccessDenied`. To learn more, see [Enable accounts
    # for Local
    # Zones](https://docs.aws.amazon.com/AmazonS3/latest/userguide/opt-in-directory-bucket-lz.html) in
    # the *Amazon S3 User Guide*.
    #
    # This functionality is only supported by directory buckets.
    property location : LocationInfo | Nil

    # Specifies the information about the bucket that will be created.
    #
    # This functionality is only supported by directory buckets.
    property bucket : BucketInfo | Nil

    # An array of tags that you can apply to the bucket that you're creating. Tags are key-value pairs
    # of metadata used to categorize and organize your buckets, track costs, and control access.
    #
    # You must have the `s3:TagResource` permission to create a general purpose bucket with tags or
    # the `s3express:TagResource` permission to create a directory bucket with tags.
    #
    # When creating buckets with tags, note that tag-based conditions using `aws:ResourceTag` and
    # `s3:BucketTag` condition keys are applicable only after ABAC is enabled on the bucket. To learn
    # more, see [Enabling ABAC in general purpose
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/buckets-tagging-enable-abac.html).
    property tags : Array(Tag) | Nil

    def initialize(
      @location_constraint : BucketLocationConstraint | Nil = nil,
      @location : LocationInfo | Nil = nil,
      @bucket : BucketInfo | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    # `root` is the element this shape is serialized under, which restXml
    # takes from the member binding it as the request payload rather than
    # from the shape's own name - they differ often enough (S3 sends a
    # CompletedMultipartUpload as <CompleteMultipartUpload>) that the caller
    # has to supply it.
    def to_xml(root : String) : String
      XML.build(indent: nil) do |xml|
        xml.element(root) { build_xml(xml) }
      end
    end

    def build_xml(xml : XML::Builder) : Nil
      if value = @location_constraint
        xml.element("LocationConstraint") { xml.text value.to_json_object_key }
      end

      if value = @location
        xml.element("Location") { value.build_xml(xml) }
      end

      if value = @bucket
        xml.element("Bucket") { value.build_xml(xml) }
      end

      xml.element("Tags") do
        (@tags || [] of Tag).each do |item|
          xml.element("Tag") { item.build_xml(xml) }
        end
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        location_constraint: (n = node.xpath_node("*[local-name()='LocationConstraint']")) ? AS::BucketLocationConstraint.from_json_object_key?(n.content) : nil,
        location: node.xpath_node("*[local-name()='Location']").try { |n| LocationInfo.from_xml(n) },
        bucket: node.xpath_node("*[local-name()='Bucket']").try { |n| BucketInfo.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='Tag']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @location
        value.validate!
      end

      if value = @bucket
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@location_constraint, @location, @bucket, @tags)
  end
end
