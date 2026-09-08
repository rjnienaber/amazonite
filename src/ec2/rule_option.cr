private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes additional settings for a stateful rule.
  class RuleOption
    # The Suricata keyword.
    property keyword : String | Nil

    # The settings for the keyword.
    property settings : Array(String) | Nil

    def initialize(
      @keyword : String | Nil = nil,
      @settings : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @keyword
        params << {"#{prefix}Keyword", value}
      end

      (@settings || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SettingSet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        keyword: Core::XMLValue.string(node.xpath_node("*[local-name()='keyword']")),
        settings: node.xpath_nodes("*[local-name()='settingSet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@keyword, @settings)
  end
end
