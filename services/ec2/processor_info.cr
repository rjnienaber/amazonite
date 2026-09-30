private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the processor used by the instance type.
  class ProcessorInfo
    # The architectures supported by the instance type.
    property supported_architectures : Array(ArchitectureType) | Nil

    # The speed of the processor, in GHz.
    property sustained_clock_speed_in_ghz : Float64 | Nil

    # Indicates whether the instance type supports AMD SEV-SNP. If the request returns `amd-sev-snp`,
    # AMD SEV-SNP is supported. Otherwise, it is not supported. For more information, see [ AMD
    # SEV-SNP](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/sev-snp.html).
    property supported_features : Array(SupportedAdditionalProcessorFeature) | Nil

    # The manufacturer of the processor.
    property manufacturer : String | Nil

    def initialize(
      @supported_architectures : Array(ArchitectureType) | Nil = nil,
      @sustained_clock_speed_in_ghz : Float64 | Nil = nil,
      @supported_features : Array(SupportedAdditionalProcessorFeature) | Nil = nil,
      @manufacturer : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@supported_architectures || [] of ArchitectureType).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedArchitectures.#{i}", item.to_json_object_key}
      end

      if value = @sustained_clock_speed_in_ghz
        params << {"#{prefix}SustainedClockSpeedInGhz", value.to_s}
      end

      (@supported_features || [] of SupportedAdditionalProcessorFeature).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedFeatures.#{i}", item.to_json_object_key}
      end

      if value = @manufacturer
        params << {"#{prefix}Manufacturer", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        supported_architectures: node.xpath_nodes("*[local-name()='supportedArchitectures']/*[local-name()='item']").compact_map { |n| AEC::ArchitectureType.from_json_object_key?(n.content) },
        sustained_clock_speed_in_ghz: Core::XMLValue.f64(node.xpath_node("*[local-name()='sustainedClockSpeedInGhz']")),
        supported_features: node.xpath_nodes("*[local-name()='supportedFeatures']/*[local-name()='item']").compact_map { |n| AEC::SupportedAdditionalProcessorFeature.from_json_object_key?(n.content) },
        manufacturer: Core::XMLValue.string(node.xpath_node("*[local-name()='manufacturer']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@supported_architectures, @sustained_clock_speed_in_ghz, @supported_features, @manufacturer)
  end
end
