# frozen_string_literal: true

require_relative "../test_helper"

class SurgeAPI::Test::Resources::AttachmentsTest < SurgeAPI::Test::ResourceTest
  def test_get_file
    skip("Mock server tests are disabled")

    response = @surge.attachments.get_file("att_01kfyc9dgdec1avkgs7tng8htg")

    assert_pattern do
      response => SurgeAPI::Models::AttachmentGetFileResponse
    end

    assert_pattern do
      response => {
        error: SurgeAPI::Error
      }
    end
  end
end
