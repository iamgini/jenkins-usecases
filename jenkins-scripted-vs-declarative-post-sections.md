The scripted equivalent to the declarative

```
steps {
  // pipeline steps here
post {
  failure {
    // failure handler here
  }
  success {
    // success handler here
  }
  always {
    // always handler here
  }
}
```

Groovy `try { } catch { }`

```
try {
  // pipeline steps here

  // success handler here
} catch(Exception e) {
  // failure handler here
} finally {
  // always handler here
}
```
