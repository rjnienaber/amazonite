private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the client-specific data.
  class ClientData
    # A user-defined comment about the disk upload.
    property comment : String | Nil

    # The time that the disk upload ends.
    property upload_end : Time | Nil

    # The size of the uploaded disk image, in GiB.
    property upload_size : Float64 | Nil

    # The time that the disk upload starts.
    property upload_start : Time | Nil

    def initialize(
      @comment : String | Nil = nil,
      @upload_end : Time | Nil = nil,
      @upload_size : Float64 | Nil = nil,
      @upload_start : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @comment
        params << {"#{prefix}Comment", value}
      end

      if value = @upload_end
        params << {"#{prefix}UploadEnd", Core::QueryValue.time(value)}
      end

      if value = @upload_size
        params << {"#{prefix}UploadSize", value.to_s}
      end

      if value = @upload_start
        params << {"#{prefix}UploadStart", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        comment: Core::XMLValue.string(node.xpath_node("*[local-name()='Comment']")),
        upload_end: Core::XMLValue.time(node.xpath_node("*[local-name()='UploadEnd']")),
        upload_size: Core::XMLValue.f64(node.xpath_node("*[local-name()='UploadSize']")),
        upload_start: Core::XMLValue.time(node.xpath_node("*[local-name()='UploadStart']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@comment, @upload_end, @upload_size, @upload_start)
  end
end
