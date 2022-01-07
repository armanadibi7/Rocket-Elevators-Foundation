require 'net/http'
require 'json'
class VoiceController < ApplicationController
    
    def register

        uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles')
        uri.query = URI.encode_www_form({
        })
        
        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'application/json'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] =  ENV['azure_speech']
        # Request body
        request.body =  ' { "locale":"en-us", } '
        
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        result = JSON.parse(response.body)
        @voice = Voice.new
        @voice.username = params[:username]
        @voice.userId = result["identificationProfileId"]
        @voice.save
        uri = URI("https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles/#{result["identificationProfileId"]}/enroll")
        uri.query = URI.encode_www_form({
            # Request parameters
            'shortAudio' => 'true'
        })

        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'multipart/form-data'
        # Request headers
                request['Ocp-Apim-Subscription-Key'] =  ENV['azure_speech']
        # Request body
        request.body = params[:upload].read
        puts params[:upload].read

        temp = params[:upload].tempfile
        puts temp.read
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        
        @operation_link = response['operation-location']
        
        puts response.body 
        uri = URI("https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles/#{result["identificationProfileId"]}")
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Get.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['azure_speech']
        # Request body
        request.body = "{body}"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        puts response.body
    end

    def checkAllStatus
        @voices = Voice.all
 

        respond_to do |format|
            format.json { render :json => @voices }
        end

    end
    
    def checkStatus

        uri = URI("https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles/#{params[:id]}")
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Get.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['azure_speech']
        # Request body
        request.body = "{body}"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        result = JSON.parse(response.body)
        
        puts response.body
      
        puts result["enrollmentStatus"]

        respond_to do |format|
            format.json { render :json => result }
        end

    end


    def identify
        puts params['myparam1']

        uri = URI("https://westus.api.cognitive.microsoft.com/spid/v1.0/identify?identificationProfileIds=dd57cb49-ee19-4b4d-884b-ce986b014e7f,98b76498-f9a7-4f90-9b1c-91deaa9521d1&shortAudio=true")
      
        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'audio/wav;codecs=audio/pcm;samplerate=16000'

        # request['Content-Type'] = 'application/octet-stream'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['azure_speech']
        # Request body
        request.body = params[:upload].read
        puts params[:upload].read
        puts "im here"
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        puts @operation_link 
        puts response.body
        puts response['operation-location']
        uri = URI(response['operation-location'])
        uri.query = URI.encode_www_form({
        })

        loop = true
        while loop
            request = Net::HTTP::Get.new(uri.request_uri)
            # Request headers
            request['Ocp-Apim-Subscription-Key'] = ENV['azure_speech']
            # Request body
            request.body = "{body}"

            response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
                http.request(request)
            end

            result = JSON.parse(response.body)
            puts result["status"]
            if result["status"] == "succeeded"
                loop = false
                puts result["processingResult"]
            end
            sleep 3
        end
        puts result["processingResult"]["identifiedProfileId"]
        puts response.body
        
        
    end

    def identify2

        puts params[:upload].temp
        uri = URI("https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles/98b76498-f9a7-4f90-9b1c-91deaa9521d1")
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Get.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['azure_speech']
        # Request body
        request.body = "{body}"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        result = JSON.parse(response.body)
        
        puts response.body
      
        puts result["enrollmentStatus"]

        
        @voices = Voice.all
 

        respond_to do |format|
            format.json { render :json => @voices }
        end
    end


    def transcribe
        
        uri = URI("https://westus.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?language=en-US")
    
        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'audio/wav;codecs=audio/pcm;samplerate=16000'

        # request['Content-Type'] = 'application/octet-stream'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['azure_speech']
        # Request body
        request.body = params[:upload].read
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        
        
        result = JSON.parse(response.body)

        @transcription = result["DisplayText"]

    
        puts "================================="
        puts result["DisplayText"]
        puts "================================="

        render template: "home/transcribe"
   
end

    
end
