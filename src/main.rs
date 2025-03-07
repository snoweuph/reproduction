use gtk::prelude::*;

fn main() -> gtk::glib::ExitCode {
    let app = adw::Application::builder()
        .application_id("io.simple.reproduction")
        .build();
    app.connect_activate(|app| {
        let win = gtk::ApplicationWindow::builder()
            .application(app)
            .title("Reproduction")
            .build();
        win.present();
    });
    app.run()
}
