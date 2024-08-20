import sys
from PyQt5.QtWidgets import QApplication, QWidget, QLabel, QLineEdit, QPushButton, QVBoxLayout, QHBoxLayout, QMessageBox
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas

def generate_ticket_pdf(name, travel_date, source, destination):
    file_name = f"{name}_ticket.pdf"
    c = canvas.Canvas(file_name, pagesize=A4)
    width, height = A4

    # Draw the content on the PDF
    c.setFont("Helvetica-Bold", 16)
    c.drawString(100, height - 100, "Travel Softie Ticket")
    
    c.setFont("Helvetica", 12)
    c.drawString(100, height - 150, f"Name: {name}")
    c.drawString(100, height - 170, f"Travel Date: {travel_date}")
    c.drawString(100, height - 190, f"Source: {source}")
    c.drawString(100, height - 210, f"Destination: {destination}")
    
    c.setFont("Helvetica-Oblique", 10)
    c.drawString(100, height - 250, "Thank you for choosing Travel Softie!")
    
    c.save()
    return file_name

class TicketApp(QWidget):
    def __init__(self):
        super().__init__()

        self.initUI()

    def initUI(self):
        self.setWindowTitle('Travel Softie Ticket Generator')

        layout = QVBoxLayout()

        # Name
        name_layout = QHBoxLayout()
        name_label = QLabel('Name:')
        self.name_input = QLineEdit()
        name_layout.addWidget(name_label)
        name_layout.addWidget(self.name_input)
        layout.addLayout(name_layout)

        # Travel Date
        date_layout = QHBoxLayout()
        date_label = QLabel('Travel Date:')
        self.date_input = QLineEdit()
        date_layout.addWidget(date_label)
        date_layout.addWidget(self.date_input)
        layout.addLayout(date_layout)

        # Source
        source_layout = QHBoxLayout()
        source_label = QLabel('Source:')
        self.source_input = QLineEdit()
        source_layout.addWidget(source_label)
        source_layout.addWidget(self.source_input)
        layout.addLayout(source_layout)

        # Destination
        destination_layout = QHBoxLayout()
        destination_label = QLabel('Destination:')
        self.destination_input = QLineEdit()
        destination_layout.addWidget(destination_label)
        destination_layout.addWidget(self.destination_input)
        layout.addLayout(destination_layout)

        # Print Button
        print_button = QPushButton('Print Ticket')
        print_button.clicked.connect(self.print_ticket)
        layout.addWidget(print_button)

        self.setLayout(layout)

    def print_ticket(self):
        name = self.name_input.text()
        travel_date = self.date_input.text()
        source = self.source_input.text()
        destination = self.destination_input.text()

        if not name or not travel_date or not source or not destination:
            QMessageBox.critical(self, "Error", "All fields are required")
            return

        ticket_file = generate_ticket_pdf(name, travel_date, source, destination)
        QMessageBox.information(self, "Success", f"Ticket generated: {ticket_file}")

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = TicketApp()
    ex.show()
    sys.exit(app.exec_())
