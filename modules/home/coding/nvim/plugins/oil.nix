{...}: {
  programs.nixvim.plugins.oil = {
    enable = true;
    autoLoad = true;

    settings = {
      default_file_explorer = true;
      delete_to_trash = true;
      prompt_save_on_select_new_entry = true;
      skip_confirm_for_simple_edits = false;
      view_options.show_hidden = true;
    };
  };
}
