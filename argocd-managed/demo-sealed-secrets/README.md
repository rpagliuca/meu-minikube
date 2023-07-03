Este app de exemplo traz a seguinte private-key versionada diretamente no Git:

Secret.my-insecure-private-key.yaml

Claramente isto não é uma boa prática, mas é necessário para que todos
que clonarem este repositório consigam ver a demonstração do sealed-secret
funcionando corretamente.

Chaves privadas devem ser únicas em cada ambiente, nunca expostas em repositórios
de aplicações, e sempre protegidas com zelo.
