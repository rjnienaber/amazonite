require "../../spec_helper"

describe Amazonite::Codegen::Service::Utils do
  described_class = Amazonite::Codegen::Service::Utils

  context "static methods" do
    subject = described_class

    describe "#snake_case_name" do
      it "handles 'BatchExecuteStatement'" do
        subject.snake_case_name("BatchExecuteStatement").should eq("batch_execute_statement")
      end

      it "handles 'DynamoDB'" do
        subject.snake_case_name("DynamoDB").should eq("dynamo_db")
      end

      it "handles 'KMSMasterKeyId'" do
        subject.snake_case_name("KMSMasterKeyId").should eq("kms_master_key_id")
      end
    end

    describe "#doc_comment" do
      it "wraps prose at the line width" do
        html = "<p>#{"word " * 30}end</p>"
        lines = subject.doc_comment(html).to_s.split("\n")
        lines.size.should eq(2)
        lines.each(&.size.should(be <= 98))
      end

      # `crystal docs` aborts on a documentation line that opens with a number
      # above Int32::MAX, so such a word never starts a wrapped line even when
      # keeping it in place overshoots the width.
      it "never starts a wrapped line with a number above Int32::MAX" do
        html = "<p>We recommend using a private ASN in the 64512-65534 (16-bit ASN) or " \
               "4200000000-4294967294 (32-bit ASN) range for the appliance.</p>"
        lines = subject.doc_comment(html).to_s.split("\n")
        lines.size.should be > 1
        lines.each(&.should_not(match(/\A# [0-9]{10}/)))
      end

      # An empty entity reference crashes `crystal docs`; a backslash escape
      # renders as a bare ampersand and leaves the entity decoder alone.
      it "escapes an ampersand that unescaping leaves in front of a semicolon" do
        html = "<p>Valid characters: a-z, A-Z, 0-9, and ._-:/()#,@[]+=&amp;;{}!$*</p>"
        subject.doc_comment(html).should eq("# Valid characters: a-z, A-Z, 0-9, and ._-:/()#,@[]+=\\&;{}!$*")
      end

      it "leaves an ordinary ampersand alone" do
        subject.doc_comment("<p>Chalk &amp; cheese</p>").should eq("# Chalk & cheese")
      end

      # Wrapping can only keep such a number off a line start when an earlier
      # word holds it in place; when the text opens with one, the digit itself
      # has to go. "&#52;" renders as "4", so the output reads the same.
      it "escapes a paragraph that opens with a number above Int32::MAX" do
        html = "<p>4200000000-4294967294 is the 32-bit ASN range.</p>"
        subject.doc_comment(html).should eq("# &#52;200000000-4294967294 is the 32-bit ASN range.")
      end

      it "escapes a list item that opens with a number above Int32::MAX" do
        html = "<ul><li>4200000000-4294967294 for 32-bit ASNs</li></ul>"
        subject.doc_comment(html).to_s.should contain("- &#52;200000000-4294967294 for 32-bit ASNs")
      end

      it "leaves a number Int32 can hold at a line start alone" do
        html = "<p>2147483647 is the largest of them.</p>"
        subject.doc_comment(html).should eq("# 2147483647 is the largest of them.")
      end

      it "still wraps before a number Int32 can hold" do
        html = "<p>#{"word " * 18}2147483647 and then some more words after it.</p>"
        lines = subject.doc_comment(html).to_s.split("\n")
        lines[1].should start_with("# 2147483647")
      end
    end
  end
end
