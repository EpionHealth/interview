module CheckIns
  module Screeners
    class ResultsController < ApplicationController
      def show
        @display_additional_screening = check_in.answers.map { |a| a.display_additional_screening? }.include?(true)
      end

      private

      def check_in
        @check_in = CheckIn.find(params[:check_in_id])
      end

      def patient
        @patient = Patient.find(params[:patient_id])
      end
    end
  end
end

