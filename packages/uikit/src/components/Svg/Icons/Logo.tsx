import React from "react";
import Svg from "../Svg";
import { SvgProps } from "../types";

const Icon: React.FC<React.PropsWithChildren<SvgProps>> = (props) => {
  return (
   <>
    <img src='https://i.ibb.co/RNYY1RN/logo-v2.png' alt='Logo' {...props} />
   </>
  );
};

export default Icon;
