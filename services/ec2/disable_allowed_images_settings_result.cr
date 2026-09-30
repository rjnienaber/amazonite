private alias AEC = Amazonite::EC2

module Amazonite::EC2
  class DisableAllowedImagesSettingsResult
    # Returns `disabled` if the request succeeds; otherwise, it returns an error.
    property allowed_images_settings_state : AllowedImagesSettingsDisabledState | Nil

    def initialize(
      @allowed_images_settings_state : AllowedImagesSettingsDisabledState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allowed_images_settings_state
        params << {"#{prefix}AllowedImagesSettingsState", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allowed_images_settings_state: (n = node.xpath_node("*[local-name()='allowedImagesSettingsState']")) ? AEC::AllowedImagesSettingsDisabledState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allowed_images_settings_state)
  end
end
