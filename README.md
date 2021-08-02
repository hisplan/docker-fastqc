# docker-fastqc

Dockerized FastQC: A high throughput sequence QC analysis tool

## How to Run

```bash
$ docker run -it --rm fastqc:0.11.9
```

- `run.sh`: Use this if you already have FASTQ files downloaded in a specific directory on your local machine.
- `download-and-run.sh`: This will download FASTQ files from BaseSpace Sequence Hub and then run FASTQC on them. This requires BaseSpace Command Line Interface (CLI).

## Build Container Image

```bash
./bulid.sh
```

## Push to Docker Registry

Either you can use the `docker push` command or run `push.sh` (requires [scing](https://github.com/hisplan/scing)):

```bash
./push.sh
```