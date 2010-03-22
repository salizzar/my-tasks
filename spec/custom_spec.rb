module CustomSpec
  def invalid_model_attribute(model, attribute)
    model.should_not be_valid
    model.errors.should be_invalid(attribute)
  end
end
