class AddAnnotationToExperiment < ActiveRecord::Migration
  def change
    rename_column(:experiments, :comments, :annotation)
  end
end
