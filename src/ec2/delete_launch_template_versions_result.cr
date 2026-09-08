private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteLaunchTemplateVersionsResult
    # Information about the launch template versions that were successfully deleted.
    property successfully_deleted_launch_template_versions : Array(DeleteLaunchTemplateVersionsResponseSuccessItem) | Nil

    # Information about the launch template versions that could not be deleted.
    property unsuccessfully_deleted_launch_template_versions : Array(DeleteLaunchTemplateVersionsResponseErrorItem) | Nil

    def initialize(
      @successfully_deleted_launch_template_versions : Array(DeleteLaunchTemplateVersionsResponseSuccessItem) | Nil = nil,
      @unsuccessfully_deleted_launch_template_versions : Array(DeleteLaunchTemplateVersionsResponseErrorItem) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@successfully_deleted_launch_template_versions || [] of DeleteLaunchTemplateVersionsResponseSuccessItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SuccessfullyDeletedLaunchTemplateVersionSet.#{i}."))
      end

      (@unsuccessfully_deleted_launch_template_versions || [] of DeleteLaunchTemplateVersionsResponseErrorItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}UnsuccessfullyDeletedLaunchTemplateVersionSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        successfully_deleted_launch_template_versions: node.xpath_nodes("*[local-name()='successfullyDeletedLaunchTemplateVersionSet']/*[local-name()='item']").map { |n| DeleteLaunchTemplateVersionsResponseSuccessItem.from_xml(n) },
        unsuccessfully_deleted_launch_template_versions: node.xpath_nodes("*[local-name()='unsuccessfullyDeletedLaunchTemplateVersionSet']/*[local-name()='item']").map { |n| DeleteLaunchTemplateVersionsResponseErrorItem.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @successfully_deleted_launch_template_versions
        value.each(&.validate!)
      end

      if value = @unsuccessfully_deleted_launch_template_versions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@successfully_deleted_launch_template_versions, @unsuccessfully_deleted_launch_template_versions)
  end
end
