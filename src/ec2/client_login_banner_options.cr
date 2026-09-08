private alias Core = Amazonite::Core

module Amazonite::EC2
  # Options for enabling a customizable text banner that will be displayed on Amazon Web Services
  # provided clients when a VPN session is established.
  class ClientLoginBannerOptions
    # Enable or disable a customizable text banner that will be displayed on Amazon Web Services
    # provided clients when a VPN session is established.
    #
    # Valid values: `true | false`
    #
    # Default value: `false`
    property enabled : Bool | Nil

    # Customizable text that will be displayed in a banner on Amazon Web Services provided clients
    # when a VPN session is established. UTF-8 encoded characters only. Maximum of 1400 characters.
    property banner_text : String | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
      @banner_text : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enabled
        params << {"#{prefix}Enabled", Core::QueryValue.bool(value)}
      end

      if value = @banner_text
        params << {"#{prefix}BannerText", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")),
        banner_text: Core::XMLValue.string(node.xpath_node("*[local-name()='BannerText']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@enabled, @banner_text)
  end
end
