private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an Amazon Inspector vulnerability finding for an AMI.
  class ImageFinding
    # Specifies whether a fix is available for the finding. This value is `true` when Amazon Inspector
    # reports a full or partial fix for the finding.
    property fix_available : Bool | Nil

    # The Amazon Inspector score for the finding.
    property score : Float64 | Nil

    # The date and time, in the ISO 8601 format in the UTC time zone (YYYY-MM-DDThh:mm:ss.sssZ), when
    # Amazon Inspector first observed the finding.
    property first_observed_at : Time | Nil

    # The date and time, in the ISO 8601 format in the UTC time zone (YYYY-MM-DDThh:mm:ss.sssZ), when
    # Amazon Inspector last updated the finding.
    property updated_at : Time | Nil

    # The title of the finding.
    property title : String | Nil

    # The file paths in the AMI that are affected by the finding. Amazon EC2 returns up to 10 file
    # paths for each finding.
    property paths : Array(String) | Nil

    # The severity of the finding.
    #
    # The valid values are the following Amazon Inspector severity levels, which correspond to CVSS
    # score ranges:
    #
    # - `informational` - CVSS score of 0.
    #
    # - `low` - CVSS score of 0.1 to 3.9.
    #
    # - `medium` - CVSS score of 4.0 to 6.9.
    #
    # - `high` - CVSS score of 7.0 to 8.9.
    #
    # - `critical` - CVSS score of 9.0 to 10.0.
    #
    # For more information, see [Software package vulnerability
    # severity](https://docs.aws.amazon.com/inspector/latest/user/findings-understanding-severity.html#findings-understanding-package-score)
    # in the *Amazon Inspector User Guide*.
    property severity_label : SeverityLabel | Nil

    # The ID of the Amazon EBS snapshot of the AMI in which the finding was detected.
    property snapshot_id : String | Nil

    def initialize(
      @fix_available : Bool | Nil = nil,
      @score : Float64 | Nil = nil,
      @first_observed_at : Time | Nil = nil,
      @updated_at : Time | Nil = nil,
      @title : String | Nil = nil,
      @paths : Array(String) | Nil = nil,
      @severity_label : SeverityLabel | Nil = nil,
      @snapshot_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @fix_available
        params << {"#{prefix}FixAvailable", Core::QueryValue.bool(value)}
      end

      if value = @score
        params << {"#{prefix}Score", value.to_s}
      end

      if value = @first_observed_at
        params << {"#{prefix}FirstObservedAt", Core::QueryValue.time(value)}
      end

      if value = @updated_at
        params << {"#{prefix}UpdatedAt", Core::QueryValue.time(value)}
      end

      if value = @title
        params << {"#{prefix}Title", value}
      end

      (@paths || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PathSet.#{i}", item}
      end

      if value = @severity_label
        params << {"#{prefix}SeverityLabel", value.to_json_object_key}
      end

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fix_available: Core::XMLValue.bool(node.xpath_node("*[local-name()='fixAvailable']")),
        score: Core::XMLValue.f64(node.xpath_node("*[local-name()='score']")),
        first_observed_at: Core::XMLValue.time(node.xpath_node("*[local-name()='firstObservedAt']")),
        updated_at: Core::XMLValue.time(node.xpath_node("*[local-name()='updatedAt']")),
        title: Core::XMLValue.string(node.xpath_node("*[local-name()='title']")),
        paths: node.xpath_nodes("*[local-name()='pathSet']/*[local-name()='item']").map { |n| n.content },
        severity_label: (n = node.xpath_node("*[local-name()='severityLabel']")) ? AEC::SeverityLabel.from_json_object_key?(n.content) : nil,
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@fix_available, @score, @first_observed_at, @updated_at, @title, @paths, @severity_label, @snapshot_id)
  end
end
