export interface ImgProps {
    src: string;
    alt: string;
    className?: string;
    style?: React.CSSProperties;
    onClick?: (event: React.MouseEvent<HTMLImageElement>) => void;
}
export default (props: ImgProps) => {
    return (
        <>
            <img  {...props} />
        </>
    )
}