require "./description"

module Amazonite::Codegen::Service
  class Files
    API_DIR = "aws-sdk-js/apis"

    def self.process(protocol = "json", &)
      matches = all_files.compact_map { |f| /#{API_DIR}\/(.+)-\d{4}-\d\d-\d\d\.normal\.json/.match(f) }
      names = Set(String).new
      matches.each do |match|
        filepath, name = match
        next if names.includes?(name)

        counter = 0
        File.each_line(filepath) do |line|
          protocol_match = /"protocol": "(.*)"/.match(line)
          next unless protocol_match

          names << name if protocol_match[1] == protocol

          counter += 1
          raise Exception.new("unable to determine protocol for '#{filepath}'") if counter > 20
        end
      end

      names.to_a.sort.each do |name|
        service_files = all_files.select { |f| /\/#{name}-\d/.matches?(f) }
        yield Files.new(name, service_files)
      end
    end

    private def self.all_files
      @@all_files ||= Dir["#{API_DIR}/*.json"]
    end

    @version_files = {} of String => Array(String)
    @files : Array(String)

    def initialize(@name : String, @files : Array(String))
    end

    def current_description
      file = current_normal_file
      raise Exception.new("couldn't find 'normal' api file for '#{@name}'") if file.nil?
      version = version_files.keys.size.to_s
      Description.new(aws_version, current_version_date, version, JSON.parse(File.read(file.as(String))))
    end

    def current_normal_file
      current_version_files.find(&.includes?("normal"))
    end

    private def current_version_date
      version_files.keys.compact.sort![-1]
    end

    private def current_version_files
      version_files[current_version_date].sort
    end

    private def version_files
      @version_files unless @version_files.empty?

      date_regex = /\d{4}-\d\d-\d\d/
      @version_files = @files.select { |f| date_regex.match(f) }.group_by do |file|
        date_regex.match(file).as(Regex::MatchData)[0]
      end
    end

    private def aws_version
      @aws_version ||= JSON.parse(File.read("aws-sdk-js/package.json"))["version"].as_s
    end
  end
end
