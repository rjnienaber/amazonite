private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableAllowedImagesSettingsRequest
    # Specify `enabled` to apply the image criteria specified by the Allowed AMIs settings. Specify
    # `audit-mode` so that you can check which AMIs will be allowed or not allowed by the image
    # criteria.
    property allowed_images_settings_state : AllowedImagesSettingsEnabledState

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @allowed_images_settings_state : AllowedImagesSettingsEnabledState,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}AllowedImagesSettingsState", @allowed_images_settings_state.to_json_object_key}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allowed_images_settings_state: ((n = node.xpath_node("*[local-name()='AllowedImagesSettingsState']")) ? AEC::AllowedImagesSettingsEnabledState.from_json_object_key?(n.content) : nil).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allowed_images_settings_state, @dry_run)
  end
end
