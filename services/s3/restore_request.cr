private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Container for restore job parameters.
  class RestoreRequest
    # Lifetime of the active copy in days. Do not use with restores that specify `OutputLocation`.
    #
    # The Days element is required for regular restores, and must not be provided for select requests.
    property days : Int32 | Nil

    # S3 Glacier related parameters pertaining to this job. Do not use with restores that specify
    # `OutputLocation`.
    property glacier_job_parameters : GlacierJobParameters | Nil

    # Amazon S3 Select is no longer available to new customers. Existing customers of Amazon S3 Select
    # can continue to use the feature as usual. [Learn
    # more](http://aws.amazon.com/blogs/storage/how-to-optimize-querying-your-data-in-amazon-s3/)
    #
    # Type of restore request.
    property type : RestoreRequestType | Nil

    # Retrieval tier at which the restore will be processed.
    property tier : Tier | Nil

    # The optional description for the job.
    property description : String | Nil

    # Amazon S3 Select is no longer available to new customers. Existing customers of Amazon S3 Select
    # can continue to use the feature as usual. [Learn
    # more](http://aws.amazon.com/blogs/storage/how-to-optimize-querying-your-data-in-amazon-s3/)
    #
    # Describes the parameters for Select job types.
    property select_parameters : SelectParameters | Nil

    # Describes the location where the restore job's output is stored.
    property output_location : OutputLocation | Nil

    def initialize(
      @days : Int32 | Nil = nil,
      @glacier_job_parameters : GlacierJobParameters | Nil = nil,
      @type : RestoreRequestType | Nil = nil,
      @tier : Tier | Nil = nil,
      @description : String | Nil = nil,
      @select_parameters : SelectParameters | Nil = nil,
      @output_location : OutputLocation | Nil = nil,
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
      if value = @days
        xml.element("Days") { xml.text value.to_s }
      end

      if value = @glacier_job_parameters
        xml.element("GlacierJobParameters") { value.build_xml(xml) }
      end

      if value = @type
        xml.element("Type") { xml.text value.to_json_object_key }
      end

      if value = @tier
        xml.element("Tier") { xml.text value.to_json_object_key }
      end

      if value = @description
        xml.element("Description") { xml.text value }
      end

      if value = @select_parameters
        xml.element("SelectParameters") { value.build_xml(xml) }
      end

      if value = @output_location
        xml.element("OutputLocation") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        days: Core::XMLValue.i32(node.xpath_node("*[local-name()='Days']")),
        glacier_job_parameters: node.xpath_node("*[local-name()='GlacierJobParameters']").try { |n| GlacierJobParameters.from_xml(n) },
        type: (n = node.xpath_node("*[local-name()='Type']")) ? AS::RestoreRequestType.from_json_object_key?(n.content) : nil,
        tier: (n = node.xpath_node("*[local-name()='Tier']")) ? AS::Tier.from_json_object_key?(n.content) : nil,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        select_parameters: node.xpath_node("*[local-name()='SelectParameters']").try { |n| SelectParameters.from_xml(n) },
        output_location: node.xpath_node("*[local-name()='OutputLocation']").try { |n| OutputLocation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @glacier_job_parameters
        value.validate!
      end

      if value = @select_parameters
        value.validate!
      end

      if value = @output_location
        value.validate!
      end
    end

    def_equals_and_hash(@days, @glacier_job_parameters, @type, @tier, @description, @select_parameters, @output_location)
  end
end
