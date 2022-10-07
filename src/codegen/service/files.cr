require "./description"

module Amazonite::Codegen::Service
  class Files
    @version_files = {} of String => Array(String)
    @files : Array(String)

    def initialize(@name : String)
      @files = all_files.select { |file| file.includes?(@name) }
    end

    def normal
      file = self.files.select { |f| f.includes?("normal") }.first
      Description.new(aws_version, JSON.parse(File.read(file)))
    end

    def files
      self.version_files[self.current_version].sort
    end

    def current_version
      self.version_files.keys.compact.sort[-1]
    end

    private def version_files
      @version_files unless @version_files.empty?

      date_regex = /\d{4}-\d\d-\d\d/
      @version_files = @files.select { |f| date_regex.match(f) }.group_by do |file|
        date_regex.match(file).as(Regex::MatchData)[0]
      end
    end

    private def all_files
      @all_files ||= Dir["aws-sdk-js/apis/*.json"]
    end

    private def aws_version
      @aws_version ||= JSON.parse(File.read("aws-sdk-js/package.json"))["version"].as_s
    end
  end
end
