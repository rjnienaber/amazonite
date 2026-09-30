private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetAllowedImagesSettingsResult
    # The current state of the Allowed AMIs setting at the account level in the specified Amazon Web
    # Services Region.
    #
    # Possible values:
    #
    # - `disabled`: All AMIs are allowed.
    #
    # - `audit-mode`: All AMIs are allowed, but the `ImageAllowed` field is set to `true` if the AMI
    # would be allowed with the current list of criteria if allowed AMIs was enabled.
    #
    # - `enabled`: Only AMIs matching the image criteria are discoverable and available for use.
    property state : String | Nil

    # The list of criteria for images that are discoverable and usable in the account in the specified
    # Amazon Web Services Region.
    property image_criteria : Array(ImageCriterion) | Nil

    # The entity that manages the Allowed AMIs settings. Possible values include:
    #
    # - `account` - The Allowed AMIs settings is managed by the account.
    #
    # - `declarative-policy` - The Allowed AMIs settings is managed by a declarative policy and can't
    # be modified by the account.
    property managed_by : ManagedBy | Nil

    def initialize(
      @state : String | Nil = nil,
      @image_criteria : Array(ImageCriterion) | Nil = nil,
      @managed_by : ManagedBy | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @state
        params << {"#{prefix}State", value}
      end

      (@image_criteria || [] of ImageCriterion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ImageCriterionSet.#{i}."))
      end

      if value = @managed_by
        params << {"#{prefix}ManagedBy", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        state: Core::XMLValue.string(node.xpath_node("*[local-name()='state']")),
        image_criteria: node.xpath_nodes("*[local-name()='imageCriterionSet']/*[local-name()='item']").map { |n| ImageCriterion.from_xml(n) },
        managed_by: (n = node.xpath_node("*[local-name()='managedBy']")) ? AEC::ManagedBy.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @image_criteria
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@state, @image_criteria, @managed_by)
  end
end
