class EvaluationController < ApplicationController
  def show
    @evaluation = Evaluation.all
  end
end
