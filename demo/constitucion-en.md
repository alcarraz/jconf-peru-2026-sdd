Principles for speckit-jetbrains-plugin, an open source JetBrains IDE plugin
that makes references between Spec Kit artifacts navigable.

1. Java only: plugin sources and tests are written in Java, so that any Java
   developer can contribute. Build with the IntelliJ Platform Gradle Plugin.
2. Platform first: use IntelliJ Platform APIs before adding any third-party
   dependency.
3. Stock Spec Kit: work with the files Spec Kit generates as they are; never
   require users to change the format of their artifacts.
4. Every IDE: depend only on the platform and bundled plugins, so it runs on
   any IntelliJ-based IDE, not only IntelliJ IDEA.
5. Tested: every reference type has platform tests (BasePlatformTestCase with
   test data files) covering resolution and missing targets.
6. Responsive: reference resolution never blocks the UI thread and scales to
   projects with many features.
7. Traceable: each change traces to a requirement or task in the feature's
   specification.
8. Language: code, comments, commits and specification artifacts are written
   in English, whatever language the conversation is held in.
9. Open source: the project is licensed under Apache-2.0 and includes a README
   that explains how to build, run and contribute.
