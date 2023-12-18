# SwiftData lernen

Dies ist das Repository für den **LinkedIn Learning** Kurs `SwiftData lernen`. Den gesamten Kurs finden Sie auf [LinkedIn Learning][lil-course-url].

![COURSENAME][lil-thumbnail-url] 

SwiftData ist Apples aktuelles Framework zur persistenten Speicherung von Daten. Es basiert auf modernen Sprach-Features von Swift, steht für alle Plattformen von Apple zur Verfügung und soll eines Tages seinen populären Vorgänger CoreData ersetzen.<br><br>

Dieser LinkedIn Learning-Kurs stellt Ihnen die grundlegende Funktionsweise von SwiftData vor: Mit Hilfe eines vorgegebenen Beispielprojekts – eine praktische Bücherverwaltung – erlernen Sie die Deklaration eines eigenen Datenmodells sowie die Erstellung eines passenden Model-Containers. Sie erfahren, wie Sie Daten persistent speichern, bearbeiten und löschen. Auch die weiterführende Konfiguration des Datenmodells mit Hilfe von Attributen und Relationships wird ausführlich gezeigt. Da SwiftData für das Zusammenspiel mit dem UI-Framework SwiftUI optimiert wurde, widmet sich ein eigenes Kapitel der Verknüpfung des Datenmodells mit Ihren Views. Ein abschließendes Video erläutert, wie Sie bestehende, auf Core Data basierende Apps nach SwiftData migrieren und wie Sie SwiftData parallel zu Core Data nutzen können.

## Anleitung

Dieses Repository hat Branches für jedes Video im Kurs. Verwenden Sie das Ausklappmenü "Branch: ..." in GitHub um zwischen den unterschiedlichen Branches hin und her zu wechseln bzw. um bei einem spezifischen Status einzusteigen. Oder Sie fügen `/tree/BRANCH_NAME` der URL hinzu um direkt in den gewünschten Branch zu wechseln.

## Branches

Die Git Branches sind passend zu den Videos im Kurs strukturiert. Die Namenskonvention lautet `Kapitel#_Video#`. Der Branch `02_03` beinhaltet zum Beispiel die Übungen für das dritte Video im zweiten Kapitel. 
Einige Branches haben einen Anfangsstatus (`b`) für "beginning" und einen Endstatus (`e`). Der Branch mit dem `e` am Ende beinhaltet in diesem Fall stets den Code der am Ende des Videos zu sehen ist. Der `master` Branch beinhaltet den initialen Quellcode und wird nicht für die Übungen innerhalb des Kurses genutzt.

Wenn Sie von einem Branch nach Änderungen zum nächsten Branch wechseln, erhalten Sie möglicherweise die folgende Meldung:

```
error: Your local changes to the following files would be overwritten by checkout:        [files]
Please commit your changes or stash them before you switch branches.
Aborting
```

Dieses Problem lösen Sie wie folgt:
    Add changes to git using this command: git add .
    Commit changes using this command: git commit -m "some message"

## Installation

1. Um diese Übungsdateien nutzen zu können, müssen Sie folgendes installiert haben:
   - Xcode (ab Version 15)
2. Klonen Sie das Repository in Ihre lokale Maschine unter Verwendung von terminal (Mac), CMD (Windows) oder ein anderes Werkzeug mit grafischer Bedienoberfläche wie SourceTree.

### Autor

**Thomas Sillmann**

_Autor und App-Entwickler_

Sehen Sie sich andere Kurse des Autors auf [LinkedIn Learning](https://www.linkedin.com/learning/instructors/thomas-sillmann) an.

[0]: # (Replace these placeholder URLs with actual course URLs)
[lil-course-url]: https://www.linkedin.com/learning/swiftdata-lernen
[lil-thumbnail-url]: https://media.licdn.com/dms/image/D560DAQEO-LLLgG8oMw/learning-public-crop_675_1200/0/1702288361324?e=2147483647&v=beta&t=Jt7UI1l8JuhLy_I-ju0cHOqofy8HWz7DGLVCKK4sHbI
