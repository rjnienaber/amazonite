private alias Core = Amazonite::Core

module Amazonite::StsV1
  class GetFederationTokenRequest
    property name : String

    property policy : String | Nil

    property policy_arns : Array(PolicyDescriptorType) | Nil

    property duration_seconds : Int32 | Nil

    property tags : Array(Tag) | Nil

    def initialize(
      @name : String,
      @policy : String | Nil = nil,
      @policy_arns : Array(PolicyDescriptorType) | Nil = nil,
      @duration_seconds : Int32 | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Name", @name}

      if value = @policy
        params << {"#{prefix}Policy", value}
      end

      (@policy_arns || [] of PolicyDescriptorType).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PolicyArns.member.#{i}."))
      end

      if value = @duration_seconds
        params << {"#{prefix}DurationSeconds", value.to_s}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")).not_nil!,
        policy: Core::XMLValue.string(node.xpath_node("*[local-name()='Policy']")),
        policy_arns: node.xpath_nodes("*[local-name()='PolicyArns']/*[local-name()='member']").map { |n| PolicyDescriptorType.from_xml(n) },
        duration_seconds: Core::XMLValue.i32(node.xpath_node("*[local-name()='DurationSeconds']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
