import sys
from PySide6.QtCore import QObject, QThread, Signal, Slot
from PySide6.QtWidgets import QApplication, QWidget, QPushButton, QVBoxLayout


class Worker(QObject):

    finished = Signal()
    progress = Signal(int)

    @Slot()
    def run(self):

        for i in range(5):
            print("작업중:", i)
            self.progress.emit(i)

        self.finished.emit()


class Window(QWidget):

    def __init__(self):
        super().__init__()

        self.button = QPushButton("작업 시작")

        layout = QVBoxLayout()
        layout.addWidget(self.button)

        self.setLayout(layout)

        self.button.clicked.connect(self.start_thread)

    def start_thread(self):

        self.thread = QThread()
        self.worker = Worker()

        self.worker.moveToThread(self.thread)

        self.thread.started.connect(self.worker.run)

        self.worker.finished.connect(self.thread.quit)
        self.worker.finished.connect(self.worker.deleteLater)

        self.thread.finished.connect(self.thread.deleteLater)

        self.worker.progress.connect(self.report_progress)

        self.thread.start()

    def report_progress(self, value):
        print("진행률:", value)


app = QApplication(sys.argv)

window = Window()
window.show()

app.exec()