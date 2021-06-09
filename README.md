# Compose CLI Docker image

Docker image with Docker Compose CLI set up and ready to use. Perfect for your CI system (GitHub Actions or GitLab CI).

Images are published as [`parisk/compose-cli`](https://github.com/users/parisk/packages/container/package/compose-cli) on GitHub Container Registry.

## Tags

Images are tagged with corresponding release of Compose CLI as found in: https://github.com/docker/compose-cli/releases, using the latest [`docker`](https://hub.docker.com/_/docker) image at the time of the release as base. For each tag there is also the `*-aws` variant, which adds awscli into the image, for convenience tasks, when you are deploying to ECS. Examples below

- `ghcr.io/parisk/compose-cli:2.0.0-beta.3`: Compose CLI [`2.0.0-beta.3`](https://github.com/docker/compose-cli/releases/tag/v2.0.0-beta.3) on [Docker 20.10.7](https://hub.docker.com/layers/docker/library/docker/20.10.7/images/sha256-63cb2df6dfe1fb041b952ddb9f75c69569331fa39577bc41a3e56cf8f79f7e2e?context=explore)
- `ghcr.io/parisk/compose-cli:2.0.0-beta.3-aws`: Compose CLI [`2.0.0-beta.3`](https://github.com/docker/compose-cli/releases/tag/v2.0.0-beta.3) on [Docker 20.10.7](https://hub.docker.com/layers/docker/library/docker/20.10.7/images/sha256-63cb2df6dfe1fb041b952ddb9f75c69569331fa39577bc41a3e56cf8f79f7e2e?context=explore) with [awscli 1.19.90](https://pypi.org/project/awscli/1.19.90/) installed on top.

## Usage

### Locally

Bind the Docker socket and your desired working directory in the container and pick your desired image:

```sh
docker run -ti \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $PWD:/usr/src/app \
  -w /usr/src/app \
  ghcr.io/parisk/compose-cli:2.0.0-beta.3 sh
```

### GitHub Actions

Use this as a Docker image step:

```yml
jobs:
  your_job:
    steps:
      - name: A step
        uses: docker://ghcr.io/parisk/compose-cli:2.0.0-beta.3
```

### GitLab CI

Put the following in the top directory of your `.gitab-ci.yml` file:

```yml
image: ghcr.io/parisk/compose-cli:2.0.0-beta.3
```

## Custom builds

You can clone this repository and build customized builds according to your needs, by tweaking the available build arguments.

### Build arguments

- `COMPOSE_CLI_VERSION`: The version of Docker Compose CLI to install (default: `v2.0.0-beta.3`)
- `AWS_CLI_VERSION`: The version of the AWS CLI to install (default: `1.19.90`)

---

Built by [Paris Kasidiaris](https://pkasid.com) and licensed under the [MIT License](./LICENSE).