private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the restoration status of an object. Objects in certain storage classes must be
  # restored before they can be retrieved. For more information about these storage classes and how
  # to work with archived objects, see [ Working with archived
  # objects](https://docs.aws.amazon.com/AmazonS3/latest/userguide/archived-objects.html) in the
  # *Amazon S3 User Guide*.
  #
  # This functionality is not supported for directory buckets. Directory buckets only support
  # `EXPRESS_ONEZONE` (the S3 Express One Zone storage class) in Availability Zones and `ONEZONE_IA`
  # (the S3 One Zone-Infrequent Access storage class) in Dedicated Local Zones.
  class RestoreStatus
    # Specifies whether the object is currently being restored. If the object restoration is in
    # progress, the header returns the value `TRUE`. For example:
    #
    # `x-amz-optional-object-attributes: IsRestoreInProgress="true"`
    #
    # If the object restoration has completed, the header returns the value `FALSE`. For example:
    #
    # `x-amz-optional-object-attributes: IsRestoreInProgress="false",
    # RestoreExpiryDate="2012-12-21T00:00:00.000Z"`
    #
    # If the object hasn't been restored, there is no header response.
    property is_restore_in_progress : Bool | Nil

    # Indicates when the restored copy will expire. This value is populated only if the object has
    # already been restored. For example:
    #
    # `x-amz-optional-object-attributes: IsRestoreInProgress="false",
    # RestoreExpiryDate="2012-12-21T00:00:00.000Z"`
    property restore_expiry_date : Time | Nil

    def initialize(
      @is_restore_in_progress : Bool | Nil = nil,
      @restore_expiry_date : Time | Nil = nil,
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
      if value = @is_restore_in_progress
        xml.element("IsRestoreInProgress") { xml.text Core::QueryValue.bool(value) }
      end

      if value = @restore_expiry_date
        xml.element("RestoreExpiryDate") { xml.text Core::QueryValue.time(value) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        is_restore_in_progress: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsRestoreInProgress']")),
        restore_expiry_date: Core::XMLValue.time(node.xpath_node("*[local-name()='RestoreExpiryDate']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@is_restore_in_progress, @restore_expiry_date)
  end
end
